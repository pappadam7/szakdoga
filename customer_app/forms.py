from django import forms
from .models import Ticket

class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = ['CustomerFirsName', 'CustomerLastName', 'CustomerEmail', 'CustomerPhone']
        widgets = {
            'CustomerFirsName': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Keresztnév'}),
            'CustomerLastName': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Vezetéknév'}),
            'CustomerEmail': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'E-mail cím'}),
            'CustomerPhone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Telefonszám'}),
        }
