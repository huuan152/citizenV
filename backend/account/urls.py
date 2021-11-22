from django.urls import path, include
from . import views
from rest_framework.routers import SimpleRouter

routers =  SimpleRouter()
routers.register('',views.UserViewSet)

urlpatterns = [
    path('login/', views.UserLoginAPIView.as_view()),
    path('schedule/', views.CensusScheduleAPIView.as_view()),
    path('', include(routers.urls))
]