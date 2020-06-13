from .views import *
from django.urls import path


app_name = "familyapp"
urlpatterns = [
    path('tasks', FamilyTask.as_view()),
    path('task_status', TaskStatus.as_view()),
    path('task_archive', TasksArchive.as_view()),
    path('auth', UserLogin.as_view())
]
