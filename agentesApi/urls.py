from django.urls import path
from .views import agentes_api

urlpatterns = [
    path('agentes/', agentes_api, name='agentes_api'),
]
