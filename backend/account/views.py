from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .authentication import JWTAuthentication
from .serializers import UserLoginForm, UserSerializer
from .models import User

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
            
            token = JWTAuthentication.generate_jwt(user.id)
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