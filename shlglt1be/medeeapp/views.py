from rest_framework import generics
from .models import Medee, MedeeTurul
from .serializers import MedeeSerializer, MedeeTurulSerializer

# Мэдээний жагсаалт ба нэмэх
class MedeeListView(generics.ListCreateAPIView):
    queryset = Medee.objects.all()
    serializer_class = MedeeSerializer

# Мэдээ засах, устгах
class MedeeUpDel(generics.RetrieveUpdateDestroyAPIView):
    queryset = Medee.objects.all()
    serializer_class = MedeeSerializer

# Мэдээний төрлийн жагсаалт ба нэмэх
class MedeeTurulListView(generics.ListCreateAPIView):
    queryset = MedeeTurul.objects.all()
    serializer_class = MedeeTurulSerializer

# Мэдээний төрлийг засах, устгах
class MedeeTurulUpDel(generics.RetrieveUpdateDestroyAPIView):
    queryset = MedeeTurul.objects.all()
    serializer_class = MedeeTurulSerializer
