# Generated by Django 3.2.2 on 2021-12-06 15:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('agency', '0001_initial'),
        ('citizen', '0013_auto_20211206_2208'),
    ]

    operations = [
        migrations.AddField(
            model_name='citizen',
            name='address_line1',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
        migrations.AddField(
            model_name='citizen',
            name='address_line2',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
        migrations.AddField(
            model_name='citizen',
            name='home_town',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
        migrations.AddField(
            model_name='citizen',
            name='id_number',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='citizen',
            name='occupations',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
        migrations.AddField(
            model_name='citizen',
            name='village_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='citizens', to='agency.agency'),
        ),
    ]