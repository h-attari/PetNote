import smtplib
from email.mime.text import MIMEText

import mysql.connector as mysql
from django.conf import settings
from django.shortcuts import redirect, render

DB_NAME = settings.DB_NAME
DB_USER = settings.DB_USER
DB_PASS = settings.DB_PASS
DB_HOST = settings.DB_HOST
BASE_DIR = settings.BASE_DIR


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


def admin_queries(req):
    flag = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name,last_name,user from Admin where flag=1"
    cr.execute(qu)
    info = cr.fetchone()
    if info is not None:
        flag = 1
        qu = "select * from Query"
        cr.execute(qu)
        temp = cr.fetchall()
        j = 1
        rec = []
        for e in temp:
            e = list(e)
            e.append(j)
            rec.append(e)
            j += 1
        final_list = []
        lst = []
        i = 0
        for r in rec:
            if i == 0:
                lst = []
            lst.append(r)
            i += 1
            if i == 2:
                i = 0
                final_list.append(lst)
                lst = []
        if len(lst) > 0:
            final_list.append(lst)
        return render(
            req, "admin/query.html", {"flag": flag, "info": info, "finallist": final_list}
        )
    return render(req, "admin/query.html", {"flag": flag})


def admin_orders(req):
    flag = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor(buffered=True)
    qu = "select name,last_name,user from Admin where flag=1"
    cr.execute(qu)
    info = cr.fetchone()
    qu = "select * from Orders"
    cr.execute(qu)
    if info is not None:
        flag = 1
        empty = 0
        o = []
        qu = "select order_id from Orders"
        cr.execute(qu)
        rec = cr.fetchall()
        if not rec:
            empty = 1
        else:
            i = []
            for e in rec:
                i.append(e[0])
            i = list(dict.fromkeys(i))
            j = 1
            for e in i:
                obj = Order()
                d = []
                qu = "select order_detail from Orders where order_id=%s"
                v = (e,)
                cr.execute(qu, v)
                rec = cr.fetchall()
                for x in rec:
                    d.append(x[0])
                data = []
                for x in d:
                    qu = "select animal_name,type,species,native from Animal where animal_id=%s"
                    v = (x,)
                    cr.execute(qu, v)
                    animal = cr.fetchone()
                    animal = list(animal)
                    qu = "select type from Type where type_id=%s"
                    v = (animal[1],)
                    cr.execute(qu, v)
                    rec = cr.fetchone()
                    animal[1] = rec[0]
                    qu = "select species_name from Species where species_id=%s"
                    v = (animal[2],)
                    cr.execute(qu, v)
                    rec = cr.fetchone()
                    animal[2] = rec[0]
                    qu = "select country_name from Country where country_id=%s"
                    v = (animal[3],)
                    cr.execute(qu, v)
                    rec = cr.fetchone()
                    animal[3] = rec[0]
                    data.append(animal)
                qu = "select r_id from Orders where order_id=%s"
                v = (e,)
                cr.execute(qu, v)
                rec = cr.fetchone()
                qu = "select name,last_name,user from Register where r_id=%s"
                cr.execute(qu, rec)
                r = cr.fetchone()
                obj.input(e, data, j, r)
                o.append(obj)
                j += 1
        return render(
            req,
            "admin/admin_orders.html",
            {"flag": flag, "info": info, "order": o, "empty": empty},
        )
    return render(req, "admin/admin_orders.html", {"flag": flag})


def query_reply(req):
    r = req.POST.get("reply")
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select * from Query where sno=%s"
    v = (r,)
    cr.execute(qu, v)
    rec = cr.fetchone()
    return render(req, "admin/reply.html", {"r": rec})


def reply_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    reply = req.POST.get("rep")
    r = req.POST.get("query")
    qu = "select * from Query where sno=%s"
    v = (r,)
    cr.execute(qu, v)
    rec = cr.fetchone()
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
        rec[1], rec[2], rec[4], rec[3], rec[5], reply
    )
    msg = MIMEText(html, "html")
    server.starttls()
    server.login(settings.EMAIL_ID, settings.EMAIL_PASSWORD)
    server.sendmail(settings.EMAIL_ID, rec[3], msg.as_string())
    server.quit()
    qu = "delete from Query where sno=%s"
    v = (r,)
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return redirect("/admins/queries")
