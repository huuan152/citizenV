# Generated by Django 3.2.2 on 2021-11-17 15:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='operate_to',
            field=models.DateTimeField(null=True),
        ),
    ]
