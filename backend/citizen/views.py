from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status

from citizen.models import Citizen
from .serializers import CitizenSerializer

# Create your views here.

class CitizenViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = CitizenSerializer
    queryset = Citizen.objects.all()
    
    def create(self, request):
        data = request.data
        data['delarer'] = request.user

        s = CitizenSerializer(data=data)
        if s.is_valid():
            s.save()
            return Response(s.data, status= status.HTTP_200_OK)
        
        return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def get_queryset(self):
        username = self.request.user.username
        if(username == '00'):
            return Citizen.objects.all()
        
        return Citizen.objects.filter(declarer_username__startsWith = username)
