from django.urls import path

from task6 import views

urlpatterns = [
    path('InvSup/', views.task6.as_view(), name='InvSup')
]
