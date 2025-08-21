from django.urls import path

from task1 import views

urlpatterns = [
    path('MonthlySales/', views.task1, name='index'),
    path('ORM/', views.task1_orm, name='index')
]
