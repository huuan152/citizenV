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
    
    def __str__(self):
        if self.level == '1':
            return self.name
        sup_a = self.sup_agency.__str__() if self.sup_agency else ''
        return f'{self.name} {sup_a}' 
