from django.conf import settings
import mysql.connector as mysql

DB_NAME = settings.DB_NAME
DB_USER = settings.DB_USER
DB_PASS = settings.DB_PASS
DB_HOST = settings.DB_HOST
BASE_DIR = settings.BASE_DIR


def get_database_connection():
    return mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
