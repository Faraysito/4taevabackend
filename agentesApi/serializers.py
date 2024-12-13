from rest_framework import serializers
from agentes.models import Agentes

class AgentesSerializer(serializers.ModelSerializer):
    categoria_nombre = serializers.CharField(source='categoria.nombre', read_only=True)

    class Meta:
        model = Agentes
        fields = ['id', 'nombre', 'descripcion', 'categoria', 'categoria_nombre', 'imagen']

