from rest_framework import serializers
from .models import User
from datetime import datetime, timedelta
from pytz import timezone

class UserLoginForm(serializers.Serializer):
    username = serializers.CharField(max_length=50)
    password = serializers.CharField(max_length=150)
    

class UserSerializer(serializers.ModelSerializer):
    
    class Meta: 
        model = User
        fields = ['username', 'level', 'is_active', 'declared_permission', 'is_staff']

class ScheduleForm(serializers.Serializer):
    operate_from = serializers.DateTimeField(format='%Y-%m-%dT%H:%M:%S:%f')
    operate_to = serializers.DateTimeField(format='%Y-%m-%dT%H:%M:%S:%f')
    user = serializers.CharField(max_length=10)

    def validate(self, data):
        """
        operate to must be in future and grate than operate_from.
        the user be update must be subordinates of request.user 
        """
        request = self.context.get('request', None)
        dt = super().validate(data)

        if(not dt.get('user', 'None').startswith(request.user.username)):
            raise serializers.ValidationError({'user': 'This user is not your subordinates'})
        
        operate_from = data.get('operate_from').astimezone()
        operate_to = data.get('operate_to').astimezone()
        now = datetime.now().astimezone(timezone('Asia/Ho_Chi_Minh'))
        print(operate_to, operate_from, operate_to < now)
        if operate_to < now:
            print("raise")
            raise serializers.ValidationError({'operate_to':'operate_to must be in the future'})
        
        if(operate_to < operate_from):
            raise serializers.ValidationError({'operate_to':'operate_to must be greate than operate_from'})
        return dt
    