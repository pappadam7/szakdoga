from django.urls import path
from operator_app import views


app_name = 'operator'
urlpatterns = [
    path('', views.index, name='index'),
    path('create_movie/', views.add_movie, name='add_movie'),
    path('movies/<int:movie_id>/', views.movie_detail, name='movie_detail'),
    path('movies/<int:movie_id>/edit/', views.edit_movie, name='edit_movie'),  # Szerkesztés nézet
    path('movies/<int:movie_id>/delete/', views.delete_movie, name='delete_movie'),
    path('create_screening/', views.add_screening, name='add_screening'),
    path('screenings/', views.screenings, name='screenings'),
    path('screenings/<int:screening_id>/delete/', views.delete_screening, name='delete_screening'),
    path('screenings/<int:screening_id>/edit/', views.edit_screening, name='edit_screening'),
]
