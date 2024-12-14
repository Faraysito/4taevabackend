from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.http import JsonResponse
from django.contrib.auth.decorators import permission_required

from .models import Personajes, Agentes, Categoria
from .forms import AgenteForm

# ============================
# Vistas relacionadas con Categorías
# ============================

# Muestra todas las categorías
def home(request):
    categorias = Categoria.objects.all()
    return render(request, 'agentes/home.html', {'categorias': categorias})

# ============================
# Vistas relacionadas con Agentes
# ============================

# Lista los agentes de una categoría específica
def lista_agente(request, categoria_id):
    categoria = get_object_or_404(Categoria, id=categoria_id)
    agentes = Agentes.objects.filter(categoria=categoria)
    return render(request, 'agentes/lista_agente.html', {'categoria': categoria, 'agentes': agentes})

# Muestra los detalles de un agente específico
def detalle_agente(request, agente_id):
    agente = get_object_or_404(Agentes, id=agente_id)
    categoria = agente.categoria
    return render(request, 'agentes/detalle_agente.html', {'agente': agente, 'categoria': categoria})

# Agregar un nuevo agente a una categoría
@permission_required('agentes.add_rioter')
def agregar_agente(request, categoria_id):
    categoria = get_object_or_404(Categoria, id=categoria_id)

    if request.method == 'POST':
        form = AgenteForm(request.POST, request.FILES)
        if form.is_valid():
            agente = form.save(commit=False)
            agente.categoria = categoria
            agente.save()
            messages.success(request, 'Agente agregado exitosamente.')
            return redirect('lista_agente', categoria_id=categoria.id)
        else:
            messages.error(request, 'Hubo un error al agregar el agente. Por favor, revisa los campos.')
    else:
        form = AgenteForm()

    return render(request, 'agentes/agregar_agente.html', {'form': form, 'categoria': categoria})

# Editar un agente
@permission_required('agentes.add_rioter')
def editar_agente(request, agente_id):
    agente = get_object_or_404(Agentes, id=agente_id)
    categoria = agente.categoria

    if request.method == 'POST':
        form = AgenteForm(request.POST, request.FILES, instance=agente)
        if form.is_valid():
            form.save()
            messages.success(request, 'Agente actualizado exitosamente.')
            return redirect('lista_agente', categoria_id=categoria.id)
        else:
            messages.error(request, 'Hubo un error al actualizar el agente. Por favor, revisa los campos.')
    else:
        form = AgenteForm(instance=agente)

    return render(request, 'agentes/editar_agente.html', {'form': form, 'agente': agente, 'categoria': categoria})

# Eliminar un agente
@permission_required('agentes.add_rioter')
def eliminar_agente(request, agente_id):
    agente = get_object_or_404(Agentes, id=agente_id)
    categoria = agente.categoria

    if request.method == 'POST':
        agente.delete()
        messages.success(request, 'Agente eliminado exitosamente.')
        return redirect('lista_agente', categoria_id=categoria.id)
    else:
        return render(request, 'agentes/eliminar_agente.html', {'agente': agente, 'categoria': categoria})