from django.contrib import admin
from django.urls import include, path

from .views import Custom404View, IndexView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', IndexView.as_view(), name='index'),
    path('', include('apps.cars.urls')),
    path('', include('apps.users.urls')),
]


handler404 = Custom404View.as_view()