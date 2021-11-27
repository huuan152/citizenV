from rest_framework import serializers

from .models import Citizen


class CitizenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citizen
        fields = ('id', 'name', 'dob', 'gender', 'ethnic', 'injected_vaccines', 'declarer')
        extra_kwargs = {
            'name': {'required': True}, 
            'dob': {'required': True},
            'gender': {'required': True}
        } 