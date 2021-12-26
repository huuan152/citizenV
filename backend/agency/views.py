from django.shortcuts import render
from django.utils.functional import partition
from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .serializers import AgencySerializer, ReadOnlyAgencySerializer
from .models import Agency
from account.models import User

from account import CadreLevels

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
        data['sup_agency'] = user.username #id of agency equal username
        id = data.get('id', 'none')
        super = user.username
        if super == '00': #cental user A1
            super = ''

        regex = f'^{super}[0-9][0-9]$'
        if  len(id) != len(super) + 2 or id[-2: -1] == '00' or not re.match(regex, id):
            return Response({
                'id': 'id must be numeric, start with your id and its length must be two characters longer than yours'
                }, status= status.HTTP_400_BAD_REQUEST)
        data['staff']['username'] = id
        data['staff']['level'] = str(int(user.level) + 1)
        data['staff']['supervisor'] = user.id

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
        #not allow change level id and staff
        data.pop('level', None)
        data.pop('staff', None)
        data.pop('id', None)
        data.pop('sup_agency', None)
        s = AgencySerializer(instance = agency, data=data, partial=True)
        if s.is_valid():
            s.save()
            return Response(s.data)
        else:
            return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False)
    def completed_declared_toggle (self, request):
        
        if (request.user.level != CadreLevels.COMMUNE):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        username = request.user.username
        agency = request.user.agency
        if agency:
            update = not agency.completed_declare
            agency.completed_declare = update
            agency.save()
            sup_agency = Agency.objects.get(id=username[:-2])
            if update == True:
                
                if not sup_agency.sub_agencies.all().filter(completed_declare=False):
                    sup_agency.completed_declare = True
                    sup_agency.save()
            else:
                sup_agency.completed_declare = False
                sup_agency.save()
                
            return Response({'current': update})
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['GET'], detail=False)
    def my(self, request):
        agency = request.user.agency
        if agency:
            data = AgencySerializer(agency).data
            data.pop('staff', None)
            data['stringName'] = agency.__str__()
            return Response(data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    
    @action(methods=['GET'], detail=False)
    def subtree(self, request):
        data = []
        level = int(request.user.level) + 1
        village_level = int(CadreLevels.VILLAGE)
        username = request.user.username
        if username == '00':
            username =''
        # query = Agency.objects.filter(id__startswith = username)
        # print(query)
        while level <= village_level:
            agencies = Agency.objects.filter(level=str(level), id__startswith = username)
            # print(agencies)
            data.append(ReadOnlyAgencySerializer(agencies, many=True).data)
            level += 1

        return Response(data, status=status.HTTP_200_OK)
    
    def get_queryset(self):
        
        user = self.request.user
        user_agency = user.agency
        if not user_agency:
            return []
        rs = user_agency.sub_agencies.all()
        return rs
