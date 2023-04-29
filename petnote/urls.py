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
from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    path('',views.index),
    path('home',views.home),
    path('login',views.login),
    path('sign', views.Register),
    path('itask', views.rigstrtask),
    path('check', views.logintask),
    path('change', views.change),
    path('logout',views.logout),
    path('profile',views.profile),
    path('chtask',views.changetask),
    path('edit',views.edit),
    path('edittask',views.edittask),
    path('cart',views.cart),
    path('reward',views.reward),
    path('order',views.order),
    path('about',views.about),
    path('help',views.help),
    path('helptask',views.helptask),
    path('filter',views.filter),
    path('search',views.search),
    path('pay',views.pay),
    path('success',views.success),
    path('detail',views.detail),
    path('add',views.addToCart),
    path('forgot',views.forgot),
    path('forgottask',views.forgottask),
    path('admins/queries',views.admin_queries),
    path('admins/orders',views.admin_orders),
    path('admins/reply',views.reply),
    path('admins/replytask',views.replytask)
    #path('',views.),
]
