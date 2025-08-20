from django.urls import path

from task4 import views

urlpatterns = [
    path('UniAnalysis/', views.task4.as_view(), name='UniAnalysis')
]
