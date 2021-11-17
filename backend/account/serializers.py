from rest_framework import serializers
from .models import User

class UserLoginForm(serializers.Serializer):
    username = serializers.CharField(max_length=50)
    password = serializers.CharField(max_length=150)
    

class UserSerializer(serializers.ModelSerializer):
    
    class Meta: 
        model = User
        fields = ['username', 'level', 'is_active', 'declared_permission', 'is_staff']
