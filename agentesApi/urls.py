from django.urls import path
from agentesApi import views

urlpatterns = [
    path('agentes/', views.agentes_listado, name='agentes_listado'),
    path('agentes/<int:pk>/', views.agentes_detalle, name='agentes_detalle' )
]
