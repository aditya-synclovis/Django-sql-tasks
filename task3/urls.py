from django.urls import path

from task3 import views

urlpatterns = [
    path('HospitalResource/', views.task3, name='index')
]
