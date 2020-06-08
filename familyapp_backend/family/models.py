from django.db import models


class Task(models.Model):
    task_title = models.CharField(max_length=64)
    task_id = models.IntegerField()
    task_description = models.CharField(max_length=1024)
    task_deadline = models.DateTimeField()
    task_author = models.IntegerField()
    task_destination = models.IntegerField()


    def __str__(self):
        return self.task_title


class User(models.Model):
    user_name = models.CharField(max_length=16)
    user_id = models.IntegerField()
