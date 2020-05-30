from rest_framework import viewsets

from .models import MyModel
from .serializers import MySerializer


# Create your views here.
class MyViewSet(viewsets.ModelViewSet):
    queryset = MyModel.objects.all()
    serializer_class = MySerializer
