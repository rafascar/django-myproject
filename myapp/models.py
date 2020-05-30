from django.db import models
from django.contrib.postgres.fields import JSONField

# Create your models here.
class MyModel(models.Model):
    myfield = models.CharField(max_length=256)
