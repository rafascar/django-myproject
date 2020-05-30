from rest_framework import routers

from .views import MyViewSet

router = routers.DefaultRouter()
router.register(r"", MyViewSet, basename="mymodel")

urlpatterns = router.urls
