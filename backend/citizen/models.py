from django.db import models
from . import Genders, Education

# Create your models here.


class Citizen(models.Model):
    name = models.CharField(max_length=80, blank=False)
    dob = models.DateField()
    dod = models.DateField(null=True, blank=True)
    gender = models.CharField(choices=Genders.CHOICES, max_length=30)
    ethnic = models.CharField(max_length=30, blank=True)
    religion = models.CharField(max_length=40, blank=True, null=True)
    educational = models.CharField(max_length=30, choices=Education.CHOICES, default=Education.HIGH)
    marital_status = models.BooleanField(default=False)
    injected_vaccines = models.IntegerField(default=0)
    
    family = models.ForeignKey('citizen.Family', related_name='members', null=True, on_delete=models.CASCADE)
    address = models.ForeignKey('agency.Agency', related_name='citizens', null=True, blank=True, on_delete=models.CASCADE)
    declarer = models.ForeignKey('account.User', related_name='declared_ctizens', on_delete= models.CASCADE)
    
    def __str__(self):
        return f'{self.declarer} {self.name}'

class Family(models.Model):
    created = models.DateField()
    declarer = models.ForeignKey('account.User', related_name='declared_families', on_delete=models.CASCADE)
    head = models.OneToOneField(Citizen, null=True, related_name='own_family',  on_delete=models.SET_NULL)

    def __str__(self):
        return f'family {self.id}'
