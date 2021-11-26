from django.shortcuts import render
from django.utils.functional import partition
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .serializers import AgencySerializer
from .models import Agency
import re

# Create your views here.
class AgencyViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = AgencySerializer
    queryset = Agency.objects.all()
    
    def create(self, request):
        data = request.data
        user = request.user
       
        data['level'] = str(int(user.level) + 1)
        data['sup_agency'] = user.username
        id = data.get('id', 'none')
        super = user.username
        if super == '00': #center
            super = ''

        regex = f'^{super}[0-9][0-9]$'
        print(re.match(regex, id), regex)
        if  len(id) != len(super) + 2 or id[-1] == '0' or not re.match(regex, id):
            return Response({
                'id': 'id must be numeric, start with your id and its length must be two characters longer than yours'
                }, status= status.HTTP_400_BAD_REQUEST)
        
        s = AgencySerializer(data=data)
        if s.is_valid():
            s.save()
            return Response(s.data, status= status.HTTP_201_CREATED)
        else:
            return Response(s.errors, status= status.HTTP_400_BAD_REQUEST)

    def update(self, request, pk):
        agency = self.get_queryset().get(id=pk)
      
        if(not agency):
            return Response(status=status.HTTP_404_NOT_FOUND)
        data = request.data
        #not allow change level
        data.pop('level', None)

        # validate id
        id = data.get('id', None)
        if id is not None:
            super = pk[:-2]
            regex = f'^{super}[0-9][0-9]$'
            if  len(id) != len(pk) or id[-1] == '0' or not re.match(regex, id):
                return Response({
                            'id': 'id must be numeric, start with your id and its length must be two characters longer than yours'
                        }, status= status.HTTP_400_BAD_REQUEST)
        # else: data.pop('id', None)# prevent send null
        s = AgencySerializer(instance = agency, data=data, partial=True)
        if s.is_valid():
            s.save()

            return Response(s.data)
        else:
            return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False)
    def completed_declared_toggle (self, request):
        agency = Agency.objects.get(id=request.user.username)
        if agency:
            update = not agency.completed_declare
            agency.completed_declare = update
            return Response({'current': update})
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False)
    def my(self, request):
        agency = Agency.objects.get(id=request.user.username)
        if agency:
            return Response(AgencySerializer(agency).data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    
    def get_queryset(self):
        user = self.request.user
        user_agency = Agency.objects.get(id=user.username)
        return user_agency.sub_agencies.all()

    
