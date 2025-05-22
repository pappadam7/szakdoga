from django.urls import path

from seller_app import views

app_name = 'seller'
urlpatterns = [
    path('', views.index, name='index'),
    path('movies/<int:movie_id>/', views.movie_detail, name='movie_detail'),
    path('screening/<int:screening_id>/', views.reservation, name='reservation'),
    path('booked/<int:screening_id>/', views.booked, name='booked'),
    path('booked/sell_conformation/<int:ticket_id>/', views.sell_conformation, name='sell_conformation'),
]
