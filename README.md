# MoziApp



## Telepítés lépései

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

## Szerver indítása
```
python manage.py runserver
```