from django.db import models
# from account.models import User
from account import CadreLevels


# Create your models here.

class Agency(models.Model):
    id = models.CharField(max_length=30, unique=True, db_index=True, primary_key=True)
    sup_agency = models.ForeignKey('self', related_name='sub_agencies', 
                        null=True, blank=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, blank=True, null=True)
    level = models.CharField(max_length=30, choices=CadreLevels.CHOICES, default=CadreLevels.CITY)
    completed_declare = models.BooleanField(default=False)

    # @property
    # def staff(self):
    #     return None#User.objects.get(username=self.id)
    
    def __str__(self):
        return f'{self.id} {self.name}'

# class StaffAgency(models.Model):
#     agency_id = models.ForeignKey(Agency, related_name='staff', on_delete=models.CASCADE, unique=True, primary_key=True)
#     staff = models.ForeignKey('user.User', related_name='agency', on_delete=models.CASCADE, unique=True, primary_key=True)
