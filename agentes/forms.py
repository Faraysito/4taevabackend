# agentes/forms.py

from django import forms
from .models import Agentes

class AgenteForm(forms.ModelForm):
    class Meta:
        model = Agentes
        fields = ['nombre', 'descripcion', 'imagen']

        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'imagen': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }
