from  rest_framework import serializers
from .models import Agency
from account.serializers import UserSerializer
from account.models import User

# class AgencySerializer(serializers.ModelSerializer):
#     staff = UserSerializer()
#     class Meta:
#         model = Agency
#         fields = ['id', 'name', 'completed_declare', 'staff']

class StaffSerializer(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = ['id', 'username', 'password', 'level', 'declared_permission', 'supervisor', 'operate_from', 'operate_to']
        extra_kwargs = {
            'supervisor': {'required': True, 'write_only': True},
            'level': {'required': True, 'write_only': True},
            'password': {'required': True, 'write_only': True}  
        }
class ReadOnlyAgencySerializer(serializers.ModelSerializer):
    class Meta:
        model = Agency
        fields = ('id', 'name')
                
class AgencySerializer(serializers.ModelSerializer):
    staff = StaffSerializer()
    # stringName = serializers.SerializerMethodField()

    class Meta:
        model = Agency
        fields = ('id', 'name', 'staff', 'level', 'sup_agency', 'completed_declare')
        extra_kwargs = {
            'level': {'required': True, 'write_only': True}, 
            'sup_agency': {'required': True, 'write_only': True},
            'completed_declare':{'read_only': True}
        }
    # def get_stringName(self, instance):
    #     return instance.__str__()

    def create(self, validated_data):
        staff_data = validated_data.pop('staff', None)
        ins = Agency.objects.create(** validated_data)
        staff = User.objects.create(agency=ins, **staff_data)  
        staff.set_password(staff_data.get('password'))
        staff.save()      
        return ins
