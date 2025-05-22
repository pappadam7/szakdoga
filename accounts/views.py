from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)

            # Próbáljuk megszerezni a next paramétert GET-ből vagy POST-ból
            next_url = request.POST.get('next') or request.GET.get('next')

            # Ha van next paraméter, menjünk oda vissza
            if next_url:
                return redirect(next_url)

            # Ha nincs next, irányítsuk szerepkör szerint
            if user.role == 'operator':
                return redirect('/operator/')
            elif user.role == 'seller':
                return redirect('/seller/')
            else:
                return redirect('/')  # Alapértelmezett fallback
        else:
            return render(request, 'accounts/login.html', {
                'error': 'Hibás adatok!',
                'next': request.POST.get('next') or request.GET.get('next', '')
            })

    return render(request, 'accounts/login.html', {
        'next': request.GET.get('next', '')
    })