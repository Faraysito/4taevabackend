from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('categoria/<int:categoria_id>/', views.lista_agente, name='lista_agente'),
    path('agente/<int:agente_id>/', views.detalle_agente, name='detalle_agente'),
    path('categoria/<int:categoria_id>/agregar/', views.agregar_agente, name='agregar_agente'),
    path('agente/<int:agente_id>/editar/', views.editar_agente, name='editar_agente'),
    path('agente/<int:agente_id>/eliminar/', views.eliminar_agente, name='eliminar_agente'),

    # Nueva sección para las APIs
    path('api/agentes_simple/', views.agentes_api, name='agentes_api'),
    path('api/agentes/', include('agentesApi.urls')),

    path('accounts/', include('django.contrib.auth.urls')),
]
