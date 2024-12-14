"""
URL configuration for AutopartsShop project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from shop.views import *
from AutopartsShop import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('test/', test),
    path('catalog/', catalog),
    path('get-models/<int:brand_id>/', get_models_by_brand),
    path('get-subcategories/<int:subcategories_id>/', get_subcategories),
    path('card-product/<int:card_id>', card_product, name='card_product'),
    path('cart/', cart, name='cart'),
    path('cart/update-item/', update_cart_item, name='update_cart_item'),
    path('cart/remove-item/', remove_cart_item, name='remove_cart_item'),
    path('cart/add/', add_to_cart, name='cart_add'),
    path('login/', login_view, name='login'),
    path('register/', register_view, name='register'),
    path('registrate/', register),
    path('login-user/', login, name='login-user'),
    path('logout/', user_logout, name='logout'),
    path('search/', search_products, name='search'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
