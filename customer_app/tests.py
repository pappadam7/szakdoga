from django.test import TestCase, Client
from django.urls import reverse
from customer_app.models import Screening, Ticket, Movie


class ToggleButtonViewTest(TestCase):
    def setUp(self):
        # Tesztadatok létrehozása
        self.client = Client()
        self.movie = Movie.objects.create(
            Title="Test Movie",
            Director="Test Director",
            ReleaseDate="2025-01-01",
            Length=120,
            Description="Test Description",
            Poster=None
        )
        self.screening = Screening.objects.create(
            MovieID=self.movie,
            Room=1,
            Start_Date="2025-01-01",
            Start_Time="18:00"
        )
        self.ticket = Ticket.objects.create(
            ScreeningID=self.screening,
            Row=3,
            Seat=5,
            CustomerFirsName="Test",
            CustomerLastName="User",
            CustomerEmail="test@example.com",
            CustomerPhone="123456789"
        )
        self.toggle_url = reverse('customer:toggle_button')

        # Egy oldal elérése CSRF token generálásához
        response = self.client.get(reverse('customer:index'))  # Olyan nézet, amely generál CSRF tokent
        self.csrf_token = response.client.cookies['csrftoken'].value

    def test_toggle_button_success(self):
        # Teszt POST kérés helyes működésére
        data = {
            "screening_id": self.screening.ID,
            "row_number": 3,
            "seat_number": 6,
            "current_class": "btn btn-success"
        }
        response = self.client.post(self.toggle_url, data, HTTP_X_CSRFTOKEN=self.csrf_token)
        self.assertEqual(response.status_code, 200)
        self.assertIn("btn-warning", response.content.decode())

    def test_toggle_button_reserved_seat(self):
        # Teszt foglalt szék esetén
        data = {
            "screening_id": self.screening.ID,
            "row_number": 3,
            "seat_number": 5,
            "current_class": "btn btn-success"
        }
        response = self.client.post(self.toggle_url, data, HTTP_X_CSRFTOKEN=self.csrf_token)
        self.assertEqual(response.status_code, 400)
        self.assertIn("Seat already reserved", response.json().get("error"))

    def test_toggle_button_missing_data(self):
        # Teszt hiányos adatok esetén
        data = {
            "screening_id": self.screening.ID,
        }
        response = self.client.post(self.toggle_url, data, HTTP_X_CSRFTOKEN=self.csrf_token)
        self.assertEqual(response.status_code, 400)
        self.assertIn("Missing data in request", response.json().get("error"))

    def test_toggle_button_get_request(self):
        # Teszt nem POST kérés esetén
        response = self.client.get(self.toggle_url)
        self.assertEqual(response.status_code, 400)
        self.assertIn("Invalid request", response.json().get("error"))
