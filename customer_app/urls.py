from django.urls import path
from customer_app import views


app_name = 'customer'
urlpatterns = [
    path('', views.index, name='index'),
    path('movies/<int:movie_id>/', views.movie_detail, name='movie_detail'),
    path('screening/<int:screening_id>/', views.reservation, name='reservation'),
    path('toggle-button/', views.toggle_button, name='toggle_button'),
    path("confirm-booking/<int:screening_id>/", views.confirm_booking, name="confirm_booking"),
    path('finalize-booking/', views.finalize_booking, name='finalize_booking'),
    path('ticket/<int:screening_id>/', views.ticket_form, name='ticket_form'),
    path('confirmation/', views.confirmation, name='confirmation'),
]
