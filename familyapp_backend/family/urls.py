from .views import FamilyTask
from django.urls import path


app_name = "familyapp"
urlpatterns = [
    path('tasks', FamilyTask.as_view()),
]
