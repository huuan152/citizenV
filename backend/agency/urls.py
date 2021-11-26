from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

routers =  SimpleRouter()
routers.register('',views.AgencyViewSet)

urlpatterns = [
    path('', include(routers.urls)),
]