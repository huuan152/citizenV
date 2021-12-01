# Generated by Django 3.2.2 on 2021-12-01 08:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('citizen', '0007_alter_family_create'),
    ]

    operations = [
        migrations.AddField(
            model_name='citizen',
            name='family',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='members', to='citizen.family'),
        ),
    ]
