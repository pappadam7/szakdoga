from django.db import models


class Movie(models.Model):
    ID = models.AutoField(primary_key=True)
    Title = models.CharField(max_length=50)
    Director = models.CharField(max_length=50)
    ReleaseDate = models.DateField()
    Length = models.IntegerField()
    Description = models.TextField()
    Poster = models.ImageField(upload_to='movies/')

    def __str__(self):
        return self.Title


class Screening(models.Model):
    ID = models.AutoField(primary_key=True)
    MovieID = models.ForeignKey(Movie, on_delete=models.CASCADE)
    Start_Date = models.DateField()
    Start_Time = models.TimeField()
    Room = models.IntegerField()


class Ticket(models.Model):
    ID = models.AutoField(primary_key=True)
    ScreeningID = models.ForeignKey(Screening, on_delete=models.CASCADE)
    Row = models.IntegerField()
    Seat = models.IntegerField()
    CustomerFirsName = models.CharField(max_length=50)
    CustomerLastName = models.CharField(max_length=50)
    CustomerEmail = models.CharField(max_length=50)
    CustomerPhone = models.CharField(max_length=50)
    Sold = models.BooleanField(default=False)
