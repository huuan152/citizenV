from  rest_framework import serializers
from .models import Agency
from account.serializers import UserSerializer

class AgencySerializer(serializers.ModelSerializer):
    staff = UserSerializer()
    class Meta:
        model = Agency
        fields = ['id', 'name','level', 'sup_agency', 'completed_declare', 'staff']
    
    # def get_staff(self, instance):
    #     # return None
    #     staff = getattr(instance, 'staff', None)
    #     if not staff:
    #         return None    
    #     return UserSerializer(staff).data

