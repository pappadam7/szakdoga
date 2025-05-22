from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, JsonResponse

from accounts.decorators import seller_required
from customer_app.models import Movie, Screening, Ticket


@seller_required
def index(request):
    movies = Movie.objects.all()
    return render(request, 'seller_app/index.html', {'movies': movies})


@seller_required
def movie_detail(request, movie_id):
    movie = get_object_or_404(Movie, ID=movie_id)
    screenings = Screening.objects.filter(MovieID=movie_id)
    return render(request, 'seller_app/movie_detail.html', {'movie': movie, 'screenings': screenings})


@seller_required
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


@seller_required
def booked(request, screening_id):
    screening = get_object_or_404(Screening, ID=screening_id)
    movie = get_object_or_404(Movie, ID=screening.MovieID.ID)
    tickets = Ticket.objects.filter(ScreeningID=screening_id)
    return render(request, 'seller_app/booked.html', {'screening': screening,
                                                      'tickets': tickets,
                                                      'movie': movie})


@seller_required
def sell_conformation(request, ticket_id):
    ticket = get_object_or_404(Ticket, ID=ticket_id)
    if request.method == 'POST':
        ticket.Sold = True
        ticket.save()
        return HttpResponse(status=204)  # siker, modal bezár
    return render(request, 'seller_app/confirmation_modal.html', {'ticket': ticket})
