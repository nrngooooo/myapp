from django.db import models

class MedeeTurul(models.Model):
    ner = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.ner

class Medee(models.Model):
    garchig = models.CharField(max_length=500)
    tailbar = models.TextField()
    niitlegch = models.CharField(max_length=255)
    turul = models.ForeignKey(MedeeTurul, on_delete=models.CASCADE, related_name='medeenuud')
    niitelsen_ognoo = models.DateTimeField(auto_now_add=True)
    eh_surwalj = models.CharField(max_length=255, blank=True, null=True)
    zurag = models.ImageField(upload_to='medee_zurag/', blank=True, null=True)
    uzelt = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.garchig
