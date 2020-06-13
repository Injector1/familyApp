from django.db import models


class Task(models.Model):
    TASK_STATUS = (
        ('W', 'Waiting'),
        ('D', 'Done'),
        ('R', 'Rejected')
    )
    task_title = models.CharField(max_length=64)
    task_id = models.IntegerField()
    task_description = models.CharField(max_length=1024)
    task_deadline = models.DateTimeField()
    task_author = models.IntegerField()
    task_destination = models.IntegerField()
    task_status = models.CharField(max_length=1, choices=TASK_STATUS)

    def __str__(self):
        return self.task_title


class User(models.Model):
    user_name = models.CharField(max_length=16)
    user_id = models.IntegerField()
    user_password = models.CharField(max_length=16)

    def __str__(self):
        return self.user_name
