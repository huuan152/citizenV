from django.db import models
from . import Genders

# Create your models here.

class Citizen(models.Model):
    name = models.CharField(max_length=80, blank=False)
    dob = models.DateField()
    gender = models.CharField(choices=Genders.CHOICES, max_length=30)
    ethnic = models.CharField(max_length=30, blank=True)
    injected_vaccines = models.IntegerField(default=0)
    declarer = models.ForeignKey('account.User', related_name='declared_ctizens', on_delete= models.CASCADE)

    def __str__(self):
        return f'{self.declarer} {self.name}'
