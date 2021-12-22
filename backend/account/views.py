from django.shortcuts import render
from rest_framework.exceptions import PermissionDenied
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import action
import re

from agency.models import Agency

from .authentication import JWTAuthentication
from .serializers import UserCreateForm, UserLoginForm, UserSerializer, ScheduleForm, UserLoginSerializer
from .models import User
from datetime import datetime, timezone
from .tasks import deactive_declared_permission, active_declared_permission

# Create your views here.
class UserLoginAPIView(APIView):    
    def post(self, request):
        s = UserLoginForm(data=request.data)
        if s.is_valid():
            data = s.data
            username = data['username']
            password = data['password']
            # print(request.user)
            user = User.objects.get(username=username)
            if not user:
                return Response({'username': ['User not exist']}, status=status.HTTP_400_BAD_REQUEST)
            if not user.check_password(password):
                return Response({'password': ['Password not exact']}, status=status.HTTP_400_BAD_REQUEST)
            
            token = JWTAuthentication.generate_jwt(user.id, request)
            response = Response()
            user_data = UserLoginSerializer(user).data
            # if user.avatar:
            #     user_data['avatar'] = request.build_absolute_uri(user_data['avatar'])
            response.data = {
                'jwt': token,
                'user_logedin': user_data
            }

            return response
        return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

class UserViewSet(ModelViewSet):
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]
    queryset = User.objects.all()
    
    def create(self, request):
        data = request.data
        user = request.user
        username = data.get('username', 'none')
        super = user.username
        if super == '00': #center
            super = ''
            
        regex = f'^{super}[0-9][0-9]$'
        if  len(username) != len(super) + 2 or username[-1] == '0' or not re.match(regex, username):
            return Response({
                'username': 'username must be numeric, start with your id and its length must be two characters longer than yours'
                }, status= status.HTTP_400_BAD_REQUEST)
        agency = Agency.objects.get(id=username)
        if (not agency):
            return Response({
                'username': 'the agency of this user has not created yet.'
                }, status= status.HTTP_400_BAD_REQUEST)
        s = UserCreateForm(data=data)
        if s.is_valid():
            dt = s.data
            new_user =  User.objects.create(
                            username= dt['username'],
                            level=str(int(user.level) + 1), 
                            supervisor=user
                        )
            new_user.set_password(dt['password'])
            new_user.save()
            
            return Response(UserSerializer(new_user).data , status= status.HTTP_201_CREATED)
        else:
            return Response(s.errors, status= status.HTTP_400_BAD_REQUEST)
    
    
    @action(methods=['GET'], detail=True)
    def toggle_declare_permission (self, request, pk):
        user = self.get_queryset().get(id=pk)
        if user:
            update = not user.declared_permission
            user.declared_permission = update
            user.save()
            return Response({'current': update})
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    
    def update(self, request, pk):
        user = self.get_queryset().get(id=pk)
        if(not user):
            return Response(status=status.HTTP_404_NOT_FOUND)
        data = request.data
        #not allow change level
        data.pop('level', None)
        data.pop('username', None)
        # validate id
        username = data.get('username', None)
        # if username is not None:
        #     super = pk[:-2]
        #     regex = f'^{super}[0-9][0-9]$'
        #     if  len(username) != len(pk) or username[-1] == '0' or not re.match(regex, username):
        #         return Response({
        #                     'username': 'username must be numeric, start with your id and its length must be two characters longer than yours'
        #             }, status= status.HTTP_400_BAD_REQUEST)
        # else: data.pop('id', None)# prevent send null
        s = UserSerializer(instance = user, data=data, partial=True)
        if s.is_valid():
            s.save()
            return Response(s.data)
        else:
            return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False)
    def my(self, request):
        user_data = UserLoginSerializer(request.user).data
        return Response(user_data)

    @action(methods=['POST'], detail=True)
    def change_password(self, request, pk):
        password = request.data.get('password', False)
        if not password:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.get(pk=pk)
        if not user:
            return Response(status=status.HTTP_404_NOT_FOUND)
        if user.supervisor != request.user:
            print("user not allowed")
            return Response(status=status.HTTP_400_BAD_REQUEST)
        user.set_password(password)
        user.save()
        return Response(status=status.HTTP_200_OK)
    
    def get_queryset(self):
        return self.request.user.subordinates.all()


    def get_permissions(self):
        if self.action == 'list':
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]

class CensusScheduleAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        s = ScheduleForm(data=request.data, context={'request': request})
        if s.is_valid():
            data = s.data
            # print("Data", data)

            operate_from = datetime.strptime(data['operate_from'], '%Y-%m-%dT%H:%M:%S:%f').astimezone()
            operate_to = datetime.strptime(data['operate_to'], '%Y-%m-%dT%H:%M:%S:%f').astimezone()
            # print(operate_from)
            user = request.user.subordinates.get(username=data['user'])
            if(user):
                now = datetime.now().astimezone()
                if operate_from > now:
                    if user.declared_permission:
                        user.declared_permission = False
                        user.save()
                    active_declared_permission.apply_async((data['user'],), eta=operate_from)

                else:
                    user.declared_permission = True 
                    user.save()
                if operate_to > now:
                    deactive_declared_permission.apply_async((data['user'],), eta=operate_to)
                else:
                    user.declared_permission = False
                    user.save()
                user.operate_from = operate_from
                user.operate_to = operate_to
                user.save()
            else: 
                return Response(status=status.HTTP_403_FORBIDDEN)
        else:
            return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response(request.data)
