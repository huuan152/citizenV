from django.core.management import BaseCommand
from django.db import connections
from django.db.utils import OperationalError
import time

from account.models import User

from faker import Faker

class Command(BaseCommand):
    def handle(self, *args, **options):
        pass
        # us = User.objects.all()
        # for u in us:
        #     u.set_password('123')
        #     u.save()
        # self.stdout.write('All of user have password is "123"')
