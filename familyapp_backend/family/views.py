from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Task, User
from .serializers import TaskSerializers, UserSerializers

class UserLogin(APIView):
    def post(self, request):
        """Logging into account"""
        if request.method == 'POST':
            user_data = request.data.get('user')
            user_name = user_data["user_name"]
            user_password = user_data["user_password"]
            user = User.objects.get(user_name=user_name)
            if user.user_password == user_password:
                return Response({"response": ["Success", user_name]})
            else:
                return Response({"response": "Error, incorrect password"})


class FamilyTask(APIView):
    def get(self, request):
        """Getting posts"""
        if request.method == 'GET':
            user_id = request.GET['id']
            tasks = Task.objects.all().filter(task_destination=user_id, task_status="W")
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


class TaskStatus(APIView):
    def post(self, request):
        if request.method == 'POST':
            task = request.data.get('task')
            task_id = task['task_id']
            task_status = task['task_status']
            query = Task.objects.get(task_id=task_id)
            query.task_status = task_status
            query.save()
            return Response({"success": "Task status changed"})


class TasksArchive(APIView):
    def get(self, request):
        """Getting archive post"""
        if request.method == 'GET':
            user_id = request.GET['user_id']
            tasks_archive = list(Task.objects.all().filter(task_author=user_id))
            tasks_archive = TaskSerializers(tasks_archive, many=True).data
            return Response({'tasks_archive': tasks_archive})
