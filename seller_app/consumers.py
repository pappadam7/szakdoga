from channels.generic.websocket import WebsocketConsumer


class TicketsConsumer(WebsocketConsumer):
    def connect(self):
        self.accept()
