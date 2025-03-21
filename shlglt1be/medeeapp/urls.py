from django.urls import path
from .views import MedeeListView, MedeeUpDel, MedeeTurulListView, MedeeTurulUpDel

urlpatterns = [
    path('medee/', MedeeListView.as_view(), name='medeelist'),
    path('medee/<int:pk>/', MedeeUpDel.as_view(), name='medeeupdel'),
    path('medee_turul/', MedeeTurulListView.as_view(), name='medeeturullist'),
    path('medee_turul/<int:pk>/', MedeeTurulUpDel.as_view(), name='medeeturulupdel'),
]
