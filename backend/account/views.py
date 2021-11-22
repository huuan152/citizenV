from django.shortcuts import render
from rest_framework.exceptions import PermissionDenied
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status

from .authentication import JWTAuthentication
from .serializers import UserLoginForm, UserSerializer, ScheduleForm
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
            user_data = UserSerializer(user).data
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
    
    def get_queryset(self):
        return self.request.user.subordinates.all()
    
    def get_permissions(self):
        if self.action == 'list':
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = []
        return [permission() for permission in permission_classes]

class CensusScheduleAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        s = ScheduleForm(data=request.data, context={'request': request})
        if s.is_valid():
            data = s.data
            print("Data", data)

            operate_from = datetime.strptime(data['operate_from'], '%Y-%m-%dT%H:%M:%S:%f').astimezone()
            operate_to = datetime.strptime(data['operate_to'], '%Y-%m-%dT%H:%M:%S:%f').astimezone()
            print(operate_from)
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
