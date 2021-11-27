from rest_framework.permissions import BasePermission

from . import CadreLevels
from .models import User

class DelarationPermission(BasePermission):

    def has_permission(self, request, view):
        user = request.user
        if not user.is_authenticated:
            return False
        level = request.user.level
        
        if level == CadreLevels.COMMUNE or level == CadreLevels.VILLAGE: # only B1 and B2 
            username = request.user.username
            l = len(username) + 1
            user_tree = [username[:i] for i in range(2, l, 2)] # 010101 => ['01', '0101', '010101']
            if User.objects.filter(username__in = user_tree, declared_permission = False).exists():
                return False
            else: return True
        return False
        
class ReadCitizenRecord(BasePermission):
    def has_permission(self, request, view):
        user = request.user
        if not user.is_authenticated:
            return False
        return True