from django.urls import path

from task5 import views

urlpatterns = [
    path('EmpTime/', views.task5.as_view(), name='EmpTime')
]
