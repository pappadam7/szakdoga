# MoziApp

## Docker

A repository tartalmaz egy docker mappát és docker compose segítségével futatható a rendszer. Ez tartalmazza az adatbázist is.  


## Telepítés lépései

A rendszer telepítése saját futtatásra.

### Git repozitori klónozása
```
git clone https://git-okt.sed.inf.szte.hu/h984794/moziapp.git
cd moziapp
```

### Virtuális környzet létrehozása
```
python3 -m venv my_env
```
Ha így nem működik akkor próbálja a "python3"-mat simán "python"-nal vagy "py"-vel helyettesíteni.
### Virtuális környzet elindítása Windows
```
my_env\Scripts\activate
```

### Virtuális környzet elindítása Unix
```
source my_env/bin/activate
```

### Requirements.txt telepítése
```
pip install -r requirements.txt
```
### Megjegyzés
Vagy egy saját PostgeSql adatbázist kell bekonfugurálni vagy érdemesebb a kikommentezett sqlite adatbázist használni.

## Szerver indítása
```
python manage.py runserver
```



## Felhasználók
Admin: F.név:Admin
PW:1234

Operátor:
F.név: Operator
PW:Op123456

Seller:
F.Név:Seller
PW:Se123456