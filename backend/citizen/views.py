from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status

from citizen.models import Citizen
from .serializers import CitizenSerializer
from account.permissions import DelarationPermission
# Create your views here.

class CitizenViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = CitizenSerializer
    queryset = Citizen.objects.all()
    
    def create(self, request):
        data = request.data
        data['declarer'] = request.user.id

        s = CitizenSerializer(data=data, partial=True)
        if s.is_valid():
            s.save()
            return Response(s.data, status= status.HTTP_200_OK)
        return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def update(self, request, pk):
        citizen = self.get_queryset().get(pk=pk)
        if citizen:
            data = request.data
            data.pop('declarer', None)
            s = CitizenSerializer(instance=citizen, data=data, partial=True)
            if s.is_valid():
                s.save()
                return Response(s.data, status= status.HTTP_200_OK)
            return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(status = status.HTTP_404_NOT_FOUND)

    def get_queryset(self):
        username = self.request.user.username
        if(username == '00'):
            return Citizen.objects.all()
        return Citizen.objects.filter(declarer__username__startswith = username)
    
    def get_permissions(self):
        if self.action == 'create' or self.action == 'update' or self.action == 'delete':
            permission_classes = [DelarationPermission]
        else:
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]