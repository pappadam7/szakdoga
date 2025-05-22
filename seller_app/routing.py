from django.urls import path
from .consumers import *

websocket_urlpattern = [
    path('ws/movies/<id>', TicketsConsumer),
]
