
from celery.utils.log import get_task_logger
from app.celery import app
from .models import User
from datetime import datetime

@app.task()
def active_declared_permission(username):
    user = User.objects.get(username=username)
    print(user)
    user.declared_permission = True
    user.save()
    print("Call Active", datetime.now())


@app.task()
def deactive_declared_permission(username):

    print(username)
    user = User.objects.get(username=username)
    print(user)
    user.declared_permission = False
    user.save()
    print('Call Deactive', datetime.now())