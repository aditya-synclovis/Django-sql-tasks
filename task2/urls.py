from django.urls import path

from task2 import views

urlpatterns = [
    path('FeeDef/', views.task2_view, name='index')
]
