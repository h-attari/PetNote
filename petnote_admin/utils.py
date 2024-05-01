import smtplib
from email.mime.text import MIMEText

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


def send_email(rec, message):
    server = smtplib.SMTP("smtp.gmail.com", 587)
    html = """
    <html>
        <body>
            <div style="margin-top:30px; font-size:18px;">
                Hello <i>{0} {1}</i>..!!
                <br><br>
                <i>Mobile:</i> {2}
                <br>
                <i>Email:</i> {3}
            </div>
            <div style="margin-top:30px; font-size:16px;">
                Answer to your query:
                <br>
                {4}
            </div>
            <div style="margin-top:30px; font-size:18px;">
                <i>Reply:</i>
                <p>{5}</p>
            </div>
        </body>
    </html>""".format(
        rec[1], rec[2], rec[4], rec[3], rec[5], message
    )
    msg = MIMEText(html, "html")
    server.starttls()
    server.login(settings.EMAIL_ID, settings.EMAIL_PASSWORD)
    server.sendmail(settings.EMAIL_ID, rec[3], msg.as_string())
    server.quit()


class Order:
    def __init__(self):
        self.order_no = None
        self.name = None
        self.last = None
        self.user = None
        self.order_id = None
        self.order_detail = None
        self.order_date = None

    def input(self, e, d, n=0, r=(0, 0, 0)):
        self.order_no = n
        self.name = r[0]
        self.last = r[1]
        self.user = r[2]
        self.order_id = e
        self.order_detail = d
        month = self.order_id[0:3]
        year = self.order_id[3:7]
        day = self.order_id[7:9]
        self.order_date = month + " " + day + " " + year
