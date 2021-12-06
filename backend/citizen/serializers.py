from rest_framework import serializers

from .models import Citizen


class CitizenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citizen
        fields = ('id', 'id_number', 'name', 'dob', 
                    'gender', 'ethnic', 'religion',
                    'declarer', 'educational', 
                    'occupations', 'village_id', 
                    'home_town', 'address_line1','address_line2'
                    
                )
        extra_kwargs = {
            'declarer': {'required': False}
        }

