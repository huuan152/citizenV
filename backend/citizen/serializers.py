from rest_framework import serializers

from .models import Citizen


class CitizenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citizen
        fields = ('id', 'name', 'dob', 'gender', 'ethnic', 'injected_vaccines', 'declarer')
        # read_only_fields = ('declarer', 'is_staff')