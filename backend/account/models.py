from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

from account import CadreLevels
from agency.models import Agency

# Create your models here.
class User(AbstractUser):
    username = models.CharField(
        _('username'),
        max_length=30,
        unique=True,
        help_text=_('Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.'),
        error_messages={
            'unique': _("A account with that username already exists."),
        },
        db_index=True
    )
    REQUIRED_FIELDS = []
    # hierarchy
    level = models.CharField(max_length=30, choices=CadreLevels.CHOICES, default=CadreLevels.CENTRAL)
    supervisor = models.ForeignKey('self', null=True, blank=True, related_name= 'subordinates',on_delete=models.CASCADE)
    # permission control
    declared_permission = models.BooleanField(default=True)
    operate_from = models.DateTimeField(auto_now_add=True, null=True)
    operate_to = models.DateTimeField(null=True)

    agency = models.OneToOneField(Agency, on_delete=models.CASCADE, related_name='staff', null=True, default= None)

    def get_citizens(self):
        return []

    

    def has_declared_permission(self):
        if not self.declared_permission:
            return False
        if self.level == CadreLevels.CITY:
            return self.declared_permission
        return self.supervisor.has_declared_permission()







