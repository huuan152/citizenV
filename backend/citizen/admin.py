from django.contrib import admin

from .models import Citizen, Family
# Register your models here.

admin.site.register(Citizen)
admin.site.register(Family)
