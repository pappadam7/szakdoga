from django.urls import path

from seller_app import views

app_name = 'seller'
urlpatterns = [
    path('', views.index, name='index'),
]
