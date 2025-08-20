from django.urls import path

from task1 import views

urlpatterns = [
    path('MonthlySales/', views.task1, name='index')
]
