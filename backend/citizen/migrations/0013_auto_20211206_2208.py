# Generated by Django 3.2.2 on 2021-12-06 15:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('citizen', '0012_alter_citizen_family'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='citizen',
            name='address',
        ),
        migrations.RemoveField(
            model_name='citizen',
            name='injected_vaccines',
        ),
    ]
