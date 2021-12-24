from django.core.management import BaseCommand
import json

from account.models import User
from agency.models import Agency

from faker import Faker
import os

class Command(BaseCommand):
    def handle(self, *args, **options):
        # pwd = os.path.dirname(__file__)
        # os.path.join(os.path.abspath(os.path.dirname('manage.py')),'dvhc.json')

        path = os.path.join(os.path.dirname(os.path.dirname(__file__)),'dvhcver2.json')
        self.stdout.write(path)
        with open(path) as f:
            data = json.loads(f.read())
            i = 0
            try:
                for agency in data:
                    if Agency.objects.filter(id=agency['id']).exists():
                
                        supervisor_id = agency['id'][:-2] if len(agency['id']) > 2 else '00'
                        supervisor  = User.objects.get(username=supervisor_id)
                        User.objects.filter(username=agency['id']).update(supervisor=supervisor, level=agency['level'])
                        Agency.objects.filter(id=agency['id']).update(**agency, sup_agency_id=supervisor_id)
                    else:
                        sup_agency = None
                        if len(agency['id']) == 2:
                            sup_agency = Agency.objects.get(id='00')
                        else: 
                            try:
                                sup_agency = Agency.objects.get(id=agency['id'][:-2])
                            except:
                                print(agency, agency['id'][:-2])
                        
                        ag = Agency.objects.create(sup_agency=sup_agency, **agency)

                        if not User.objects.filter(username=agency['id']).exists():
                            supervisor_id = agency['id'][:2] if len(agency['id']) > 2 else '00'
                            supervisor  = User.objects.get(username=supervisor_id)
                            user = User.objects.create(username=agency['id'], password='123', agency=ag, supervisor=supervisor, level=agency['level'])
                            user.set_password('123')
                            user.save()
                            

                    i += 1
                    if (i > 2500):
                        break
            except:
                print("Not found", agency)
            



            



                

        