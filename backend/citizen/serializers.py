from rest_framework import serializers

from .models import Citizen, Family


class CitizenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citizen
        fields = ('id', 'name', 'dob', 'dod', 
                    'gender', 'ethnic', 'religion', 'educational', 
                    'marital_status', 'family', 'address', 
                    'injected_vaccines', 'declarer'
                )
        extra_kwargs = {
            'name': {'required': True}, 
            'dob': {'required': True},
            'gender': {'required': True},
            'declarer': {'required': False}
        }
class FamilySerializer(serializers.ModelSerializer):
    head_index = serializers.IntegerField(write_only=True)
    members = CitizenSerializer(many=True, partial=True)
    class Meta:
        model = Family
        fields = ('id','head_index', 'head', 'created', 'members', 'declarer')
        extra_kwargs = {
            'head': {'read_only': True}, 
            'head_index': {'required': True, 'write_only': True},
            'declarer': {'read_only': True}
        }
    
    def create(self, validated_data):
        # print(validated_data)
        request = self.context.get('request')
        members = validated_data.pop('members', None)
        head_index = validated_data.pop('head_index', None)
        
        family = Family.objects.create(declarer=request.user, **validated_data)
        head = 0
        for member in members:
            citizen = Citizen.objects.create(declarer=request.user, family=family, **member)
            if head == head_index:
                family.head = citizen
                family.save()
            head += 1
        return family
        
    def update(self, instance, validated_data):
        validated_data.pop('members', None)
        head_index = validated_data.pop('head_index', None)
        head = instance.members.all()[head_index]
        instance.head = head
        instance.created = validated_data.get('created', instance.created)
        return instance

    def validate(self, data):
        dt = super().validate(data)
        print("dt", dt)
        if dt.get('head_index', 100) >= len(dt.get('members', [])):
            raise serializers.ValidationError({'head_index': 'head_index is out of range'})
        return dt
