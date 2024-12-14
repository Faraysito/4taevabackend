from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from agentes.models import Agentes
from .serializers import AgentesSerializer

@api_view(['GET', 'POST'])
def agentes_listado(request):
    if request.method == 'GET':
        agentes = Agentes.objects.all()
        serializer = AgentesSerializer(agentes, many=True)
        return Response(serializer.data)

    if request.method == 'POST':
        serializer = AgentesSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def agentes_detalle(request, pk):
    try:
        agente = Agentes.objects.get(pk=pk)
    except Agentes.DoesNotExist:
        return Response({'error': 'El agente no existe.'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = AgentesSerializer(agente)
        return Response(serializer.data)

    if request.method == 'PUT':
        serializer = AgentesSerializer(agente, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'DELETE':
        agente.delete()
        return Response({'message': 'Agente eliminado correctamente.'}, status=status.HTTP_204_NO_CONTENT)
