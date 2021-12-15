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
    
    def validate(self, data):
        dt = super().validate(data)
        id_number = str(dt.get('id_number', '')).strip()
        if id_number is not None and len(id_number) > 0:
            if Citizen.objects.filter(id_number = id_number).exists():
                raise serializers.ValidationError({'id_number': {'citizen width this id_number has exist'}})
        if id_number is not None and len(id_number) != 0 and len(id_number) != 9 and len(id_number) != 12:
            raise serializers.ValidationError({'id_number': {'id_number': 'CCMND/CCCD phải 9/12 chữ số hoặc trống khi chưa đực cấp'}})
        return dt

class CitizenUpdateSerializer(serializers.ModelSerializer):
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
    def validate(self, data):
        dt = super().validate(data)
        id_number = str(dt.get('id_number', '')).strip()
        
        if id_number is not None and (len(id_number) != 0 and len(id_number) != 9 and len(id_number) != 12):
            raise serializers.ValidationError({'id_number': {'id_number': 'CCMND/CCCD phải 9/12 chữ số hoặc trống khi chưa được cấp'}})
        return dt
    # def validate(self, data):
    #     dt = super().validate(data)
    #     id_number = str(dt.get('id_number', '')).strip()
    #     if id_number is not None and len(id_number) > 0:
    #         if Citizen.objects.filter(id_number = id_number).exists():
    #             raise serializers.ValidationError({'id_number': {'citizen width this id_number has exist'}})
    #     return dt
