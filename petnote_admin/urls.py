from django.urls import path

from . import views

urlpatterns = [
    path("queries", views.admin_queries),
    path("orders", views.admin_orders),
    path("reply", views.query_reply),
    path("replytask", views.reply_task)
]
