"""petnote URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.urls import path, include

from . import views

urlpatterns = [
    path("", views.index),
    path("home", views.home),
    path("login", views.login),
    path("sign", views.register),
    path("itask", views.register_task),
    path("check", views.login_task),
    path("change", views.change),
    path("logout", views.logout),
    path("profile", views.profile),
    path("chtask", views.change_task),
    path("edit", views.edit),
    path("edittask", views.edit_task),
    path("cart", views.cart),
    path("reward", views.reward),
    path("order", views.order),
    path("about", views.about),
    path("help", views.request_help),
    path("helptask", views.help_task),
    path("filter", views.search_filter),
    path("search", views.search),
    path("pay", views.pay),
    path("success", views.success),
    path("detail", views.detail),
    path("add", views.add_to_cart),
    path("forgot", views.forgot),
    path("forgottask", views.forgot_task),
    # path('',views.),

    path("admins/", include("petnote_admin.urls"))
]
