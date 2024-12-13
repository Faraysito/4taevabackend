from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from agentes.models import Agentes
from .serializers import AgentesSerializer

# API básica para listar agentes (no usa DRF)
def agentes_api(request):
    agentes = Agentes.objects.all()
    data = {
        'agentes': list(
            agentes.values('id', 'nombre', 'descripcion', 'categoria__nombre')
        )
    }
    return JsonResponse(data, safe=False)

# API avanzada para listar y crear agentes
@api_view(['GET', 'POST'])
def agentes_listado(request):
    if request.method == 'GET':
        # Listar todos los agentes
        agentes = Agentes.objects.all()
        serializer = AgentesSerializer(agentes, many=True)
        return Response(serializer.data)

    if request.method == 'POST':
        # Crear un nuevo agente
        serializer = AgentesSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# API para operaciones detalladas: obtener, actualizar y eliminar un agente específico
@api_view(['GET', 'PUT', 'DELETE'])
def agentes_detalle(request, pk):
    try:
        # Buscar el agente por su clave primaria
        agente = Agentes.objects.get(pk=pk)
    except Agentes.DoesNotExist:
        return Response({'error': 'El agente no existe.'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        # Obtener los detalles de un agente
        serializer = AgentesSerializer(agente)
        return Response(serializer.data)

    if request.method == 'PUT':
        # Actualizar un agente
        serializer = AgentesSerializer(agente, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'DELETE':
        # Eliminar un agente
        agente.delete()
        return Response({'message': 'Agente eliminado correctamente.'}, status=status.HTTP_204_NO_CONTENT)
