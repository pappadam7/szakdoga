from django import forms
from customer_app.models import Screening, Movie
from datetime import date


class ScreeningForm(forms.ModelForm):
    MovieID = forms.ModelChoiceField(
        queryset=Movie.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Film címe",  # Címke módosítása
        empty_label="Válassz filmet",  # Opció az üres értékre
    )

    class Meta:
        model = Screening
        fields = ['MovieID', 'Start_Date', 'Start_Time', 'Room']
        labels = {
            'Start_Date': 'Vetítés napja',
            'Start_Time': 'Vetítés időpontja',
            'Room': 'Terem',
        }

        widgets = {
            'Start_Date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'Start_Time': forms.TimeInput(attrs={'type': 'time', 'class': 'form-control'}),
            'Room': forms.NumberInput(attrs={'class': 'form-control', 'min': '1', 'max': '2', 'step': '1'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Automatikus dátum kitöltése a mai nappal
        self.fields['Start_Date'].initial = date.today()
