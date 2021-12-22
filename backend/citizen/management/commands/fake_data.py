from django.core.management import BaseCommand
from django.db import connections
from django.db.utils import OperationalError

import csv
from account.models import User
import codecs

import os
import random

from citizen.models import Citizen

class Command(BaseCommand):
    def handle(self, *args, **options):
        # pwd = os.path.dirname(__file__)
        # os.path.join(os.path.abspath(os.path.dirname('manage.py')),'/update.csv')

        path = os.path.join(os.path.dirname(os.path.dirname(__file__)),'data_ver2.csv')
        # self.stdout.write(path)
        with open(path) as f:
            reader = csv.DictReader(f)
            data = [line for line in reader]
            random.shuffle(data)
            user_villages = User.objects.filter(level='4')
            # print(user_villages.count())
            k = 0
            Citizen.objects.all().delete()
            for v in user_villages:
                address = v.agency.__str__()
                for i in range(20):
                    Citizen.objects.create(home_town=address, 
                        address_line1=address, 
                        address_line2=address, 
                        declarer=v, 
                        village_id =v.agency, 
                        **data[k*20 + i])
                    # print(data[k*100 + i]['name'])
                k += 1

                    




        
            

