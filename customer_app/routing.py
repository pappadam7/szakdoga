from django.urls import path
from . import consumers

websocket_urlpatterns = [
    path("ws/seat_updates/<int:screening_id>/", consumers.SeatConsumer.as_asgi()),
]