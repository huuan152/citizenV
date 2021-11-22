from rest_framework.permissions import BasePermission
from .models import User

class DelarationPermission(BasePermission):

    def has_permission(self, request, view):
        user = request.user
        if not user.is_authenticated:
            return False
        
        return request.user.has_declared_permission()

class ReadCitizenRecord(BasePermission):
    def has_permission(self, request, view):
        user = request.user
        if not user.is_authenticated:
            return False
        return True