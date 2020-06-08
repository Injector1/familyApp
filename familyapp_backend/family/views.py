from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Task, User
from .serializers import TaskSerializers, UserSerializers


class FamilyTask(APIView):
    def get(self, request):
        """Getting posts"""
        if request.method == 'GET':
            user_id = request.GET['id']
            tasks = Task.objects.all().filter(task_destination=user_id)
            serializer = TaskSerializers(tasks, many=True)
            return Response({'tasks': serializer.data})
        else:
            return Response({'message': 'ERROR, POST request'})


    def post(self, request):
        """Making new posts"""
        if request.method == 'POST':
            task = request.data.get('task')
            serializer = TaskSerializers(data=task)
            if serializer.is_valid(raise_exception=True):
                task_saved = serializer.save()
            return Response({"success": "Task saved"})

