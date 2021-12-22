from django.core.management import BaseCommand
from django.db import connections
from django.db.utils import OperationalError
import time
import json
import csv
from account.models import User
import codecs
from faker import Faker

class Command(BaseCommand):
    def handle(self, *args, **options):
        with open('../update.csv') as f:
            reader = csv.DictReader(codecs.iterdecode(f, 'utf-8'))
            for line in reader:
                self.stdout.write(line['name'])
        
            

