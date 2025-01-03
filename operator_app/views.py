from django.shortcuts import render, redirect, get_object_or_404
from .forms.add_form import AddForm
from  .forms.add_screening_form import ScreeningForm
from customer_app.models import Movie, Screening


def index(request):
    movies = Movie.objects.all()
    return render(request, 'operator_app/index.html', {'movies': movies})


def add_movie(request):
    if request.method == 'POST':
        form = AddForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/operator/')
    else:
        form = AddForm()
    return render(request, 'operator_app/add_movie.html', {'form': form})


def movie_detail(request, movie_id):
    movie = get_object_or_404(Movie, ID=movie_id)
    return render(request, 'operator_app/movie_detail.html', {'movie': movie})


def edit_movie(request, movie_id):
    movie = get_object_or_404(Movie, ID=movie_id)  # Film lekérése
    if request.method == 'POST':
        form = AddForm(request.POST, request.FILES, instance=movie)
        if form.is_valid():
            form.save()
            return redirect('movie_detail', movie_id=movie.ID)
    else:
        form = AddForm(instance=movie)
    return render(request, 'operator_app/edit_movie.html', {'form': form, 'movie': movie})


def delete_movie(request, movie_id):
    movie = get_object_or_404(Movie, ID=movie_id)
    if request.method == 'POST':
        movie.delete()
        return redirect('/operator/')
    return render(request, 'operator_app/delete_movie.html', {'movie': movie})


def screenings(request):
    screening = Screening.objects.all()
    return render(request, 'operator_app/list_screening.html', {'screenings': screening})


def add_screening(request):
    if request.method == 'POST':
        form = ScreeningForm(request.POST)
        if form.is_valid():
            form.save()  # Mentés az adatbázisba
            return redirect('/operator/screenings')  # Vissza a vetítések listájához
    else:
        form = ScreeningForm()
    return render(request, 'operator_app/add_screening.html', {'form': form})


def edit_screening(request, screening_id):
    screening = get_object_or_404(Screening, ID=screening_id)  # Lekéri az adott vetítést
    if request.method == 'POST':
        form = ScreeningForm(request.POST, instance=screening)  # Létrehoz egy formot az aktuális adatokkal
        if form.is_valid():
            form.save()  # Mentés az adatbázisba
            return redirect('/operator/screenings')  # Vissza a vetítések listájához
    else:
        form = ScreeningForm(instance=screening)  # Kitöltött form a meglévő adatokkal
    return render(request, 'operator_app/edit_screening.html', {'form': form, 'screening': screening})


def delete_screening(request, screening_id):
    screening = get_object_or_404(Screening, ID=screening_id)  # Lekéri az adott vetítést
    if request.method == 'POST':  # Csak POST-kérés esetén töröl
        screening.delete()
        return redirect('/operator/screenings')  # Visszairányítás a vetítések listájára
    return render(request, 'operator_app/delete_screening.html', {'screening': screening})
