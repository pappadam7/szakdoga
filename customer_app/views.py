from django.core.mail import send_mail
from django.http import Http404, JsonResponse, HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
import json

from django.template.loader import render_to_string

from .models import Movie, Screening, Ticket
from .forms import TicketForm
from .utils import generate_email_content
from django.middleware.csrf import get_token


def index(request):
    movies = Movie.objects.all()
    return render(request, 'customer_app/index.html', {'movies': movies})


def movie_detail(request, movie_id):
    movie = get_object_or_404(Movie, ID=movie_id)
    screenings = Screening.objects.filter(MovieID=movie_id)
    return render(request, 'customer_app/movie_detail.html', {'movie': movie, 'screenings': screenings})


def reservation(request, screening_id):
    screening = get_object_or_404(Screening, ID=screening_id)
    movie = get_object_or_404(Movie, ID=screening.MovieID.ID)
    reserved_seats = Ticket.objects.filter(ScreeningID=screening).values_list("Row", "Seat")
    print(reserved_seats)
    reserved_seats_set = set(reserved_seats)
    if screening.Room == 1:
        # Kiválasztott székek logikájának előkészítése
        rows = range(10)  # Feltételezve, hogy 10 sor van
        seats = range(1, 10)  # Feltételezve, hogy 1-től 9-ig vannak székek

        seat_data = [
            {
                "row": row,
                "seats": [
                    {
                        "number": seat,
                        "reserved": (row, seat) in reserved_seats_set,
                    }
                    for seat in seats
                ]
            }
            for row in rows
        ]

        return render(request, 'rooms/room1.html', {'movie_id': movie,
                                                    'screening': screening,
                                                    'seat_data': seat_data})
    if screening.Room == 2:
        return render(request, 'rooms/room2.html', {'movie_id': movie})
    else:
        raise Http404


def toggle_button(request):
    if request.method == "POST":
        row = request.POST.get("row_number")
        seat = request.POST.get("seat_number")
        current_class = request.POST.get("current_class")
        screening_id = request.POST.get("screening_id")

        # Ellenőrizd, hogy minden szükséges adat megérkezett
        if not all([row, seat, current_class, screening_id]):
            return JsonResponse({"error": "Missing data in request"}, status=400)

        # Lefoglalt székek lekérdezése
        reserved_seats = Ticket.objects.filter(ScreeningID=screening_id).values("Row", "Seat")

        # Sütiből olvasás
        selected_seats_raw = request.COOKIES.get("selected_seats", "[]")
        try:
            selected_seats = json.loads(selected_seats_raw)
        except json.JSONDecodeError:
            selected_seats = []

        # Ellenőrizd, hogy a szék már le van-e foglalva
        if {"Row": int(row), "Seat": int(seat)} in reserved_seats:
            return JsonResponse({"error": "Seat already reserved"}, status=400)

        # Kiválasztott székek frissítése
        seat_obj = {"row": row, "seat": seat}
        if current_class == "btn btn-success":
            selected_seats.append(seat_obj)
            new_class = "btn btn-warning"
        else:
            selected_seats = [s for s in selected_seats if not (s["row"] == row and s["seat"] == seat)]
            new_class = "btn btn-success"

        # Gomb HTML generálása
        button_html = render_to_string("customer_app/button_partial.html", {
            "csrf_token": get_token(request),
            "row": row,
            "seat": seat,
            "class": new_class,
            "screening_id": screening_id,
        })

        # Süti frissítése és HTML visszaadása
        response = HttpResponse(button_html, content_type="text/html")
        response.set_cookie("selected_seats", json.dumps(selected_seats), httponly=True)
        return response

    return JsonResponse({"error": "Invalid request"}, status=400)


def confirm_booking(request, screening_id):
    # Sütiből kiválasztott székek olvasása
    selected_seats_raw = request.COOKIES.get("selected_seats", "[]")
    try:
        selected_seats = json.loads(selected_seats_raw)
    except json.JSONDecodeError:
        selected_seats = []

    if request.method == "POST":
        customer_name = request.POST.get("customer_name")
        customer_email = request.POST.get("customer_email")
        screening = Screening.objects.get(pk=screening_id)

        # Jegyek létrehozása
        for seat in selected_seats:
            Ticket.objects.create(
                ScreeningID=screening,
                Row=int(seat["row"]),
                Seat=int(seat["seat"]),
                CustomerFirsName=customer_name.split()[0],
                CustomerLastName=" ".join(customer_name.split()[1:]),
                CustomerEmail=customer_email,
                CustomerPhone="N/A",
            )

        # Süti törlése
        response = render(request, "customer_app/confirmation.html")
        response.delete_cookie("selected_seats")
        return response

    return render(request, "customer_app/confirm_booking.html", {
        "selected_seats": selected_seats,
    })


def finalize_booking(request):
    return render(request, 'customer_app/finalize_booking.html')


def ticket_form(request, screening_id):
    # Sütiből kiválasztott székek olvasása
    selected_seats_raw = request.COOKIES.get("selected_seats", "[]")
    try:
        selected_seats = json.loads(selected_seats_raw)
    except json.JSONDecodeError:
        selected_seats = []

    if request.method == "POST":
        form = TicketForm(request.POST)
        if form.is_valid():
            customer_first_name = form.cleaned_data['CustomerFirsName']
            customer_last_name = form.cleaned_data['CustomerLastName']
            customer_email = form.cleaned_data['CustomerEmail']
            customer_phone = form.cleaned_data['CustomerPhone']
            screening = Screening.objects.get(pk=screening_id)

            # Jegyek mentése
            for seat in selected_seats:
                Ticket.objects.create(
                    ScreeningID=screening,
                    Row=int(seat["row"]),
                    Seat=int(seat["seat"]),
                    CustomerFirsName=customer_first_name,
                    CustomerLastName=customer_last_name,
                    CustomerEmail=customer_email,
                    CustomerPhone=customer_phone,
                )

            # Süti törlése és visszaigazolás
            response = redirect('customer:confirmation')
            response.delete_cookie("selected_seats")
            return response
    else:
        form = TicketForm()

    return render(request, 'customer_app/ticket_form.html', {
        'form': form,
        'selected_seats': selected_seats,
    })


def confirmation(request):
    return render(request, 'customer_app/confirmation.html')
