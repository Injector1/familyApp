from rest_framework import serializers
from .models import Task

class TaskSerializers(serializers.Serializer):
    task_title = serializers.CharField(max_length=64)
    task_id = serializers.IntegerField()
    task_description = serializers.CharField(max_length=1024)
    task_deadline = serializers.DateTimeField()
    task_author = serializers.IntegerField()
    task_destination = serializers.IntegerField()

    def create(self, validated_data):
        return Task.objects.create(**validated_data)


class UserSerializers(serializers.Serializer):
    user_name = serializers.CharField(max_length=16)
    user_id = serializers.IntegerField()
