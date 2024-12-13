from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),  # Admin panel
    path('', include('agentes.urls')),  # Rutas de la app agentes
    path('accounts/', include('django.contrib.auth.urls')),  # Autenticación integrada de Django
    path('api/', include('agentesApi.urls')),  # Rutas de la app agentesApi
]
