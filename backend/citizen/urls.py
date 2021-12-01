from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

routers =  SimpleRouter()
routers.register('citizen', views.CitizenViewSet)
routers.register('family', views.FamilyViewzSet)
urlpatterns = [
    path('', include(routers.urls)),
]