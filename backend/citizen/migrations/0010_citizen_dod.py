# Generated by Django 3.2.2 on 2021-12-01 08:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('citizen', '0009_alter_citizen_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='citizen',
            name='dod',
            field=models.DateField(blank=True, null=True),
        ),
    ]