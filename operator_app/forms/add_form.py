from django import forms
from customer_app.models import Movie


class AddForm(forms.ModelForm):
    class Meta:
        model = Movie
        fields = ['Title', 'Director', 'ReleaseDate', 'Length', 'Description', 'Poster']  # Minden mező a formhoz
        labels = {
            'Title': 'Cím',
            'Director': 'Rendező',
            'ReleaseDate': 'Kidás dátuma',
            'Length': 'Játékidő',
            'Description': 'Leírás',
            'Poster': 'Poszter'

        }
        widgets = {
            'Title': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Film címe'}),
            'Director': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Rendező'}),
            'ReleaseDate': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'Length': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Hossz (percben)'}),
            'Description': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Film leírása'}),
            'Poster': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }
