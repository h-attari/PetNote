import os
import smtplib
from datetime import date
from email.mime.text import MIMEText

import mysql.connector as mysql
from django.conf import settings
from django.shortcuts import redirect, render

DB_NAME = settings.DB_NAME
DB_USER = settings.DB_USER
DB_PASS = settings.DB_PASS
DB_HOST = settings.DB_HOST


def index(req):
    return redirect("/home")


def home(req):
    flag = 0
    s = []
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name, user from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    qu = "select type from Type"
    cr.execute(qu)
    temp = cr.fetchall()
    for e in temp:
        s.append(e[0])
    qu = "select species_name from Species"
    cr.execute(qu)
    recc = cr.fetchall()
    l = []
    for e in recc:
        l.append(e[0])
        s.append(e[0])
    if rec:
        flag = 1
    qu = "select animal_name,price,discount,image from Animal"
    cr.execute(qu)
    temp = cr.fetchall()
    arec = []
    for e in temp:
        s.append(e[0])
        e = list(e)
        e[2] = e[1] - ((e[2] / 100) * e[1])
        e[2] = round(e[2], 3)
        e = tuple(e)
        arec.append(e)
    final_list = []
    i = 0
    for r in arec:
        if i == 0:
            lst = []
        lst.append(r)
        i += 1
        if len(final_list) == 3:
            break
        if i == 5:
            i = 0
            final_list.append(lst)
            lst = []
    if len(final_list) < 3:
        if len(lst) > 0:
            final_list.append(lst)
    conn.close()
    if flag == 1:
        n = []
        for e in rec:
            for x in e:
                n.append(x)
        name = n[0]
        user = n[1]
        return render(
            req,
            "home/home.html",
            {
                "flag": flag,
                "name": name,
                "user": user,
                "req": l,
                "arec": final_list,
                "s": s,
            },
        )
    return render(req, "home/home.html", {"flag": flag, "req": l, "arec": final_list, "s": s})


def login(req):
    return render(req, "users/login.html")


def register(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select country_name from Country"
    cr.execute(qu)
    rec = cr.fetchall()
    lst = []
    for e in rec:
        lst.append(e[0])
    conn.close()
    return render(req, "users/signup.html", {"list": lst})


def register_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    name = req.POST.get("fname")
    last = req.POST.get("lname")
    user = req.POST.get("user")
    password = req.POST.get("password")
    country = req.POST.get("country")
    mobile = req.POST.get("mobile")
    email = req.POST.get("email")
    address = req.POST.get("address")
    cr = conn.cursor()
    qu = "select country_id from Country where country_name=%s"
    v = (country,)
    cr.execute(qu, v)
    rec = cr.fetchone()
    country = rec[0]
    qu = "insert into Register(name,last_name,user,password,email,country,mobile,address) " \
         "values('{0}','{1}','{2}','{3}','{4}',{5},'{6}','{7}')".format(
            name, last, user, password, email, country, mobile, address)
    cr.execute(qu)
    conn.commit()
    conn.close()
    return redirect("/home")


def login_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    radio = req.POST.get("choose")
    u = req.POST.get("user")
    p = req.POST.get("passw")
    if radio == "admin":
        qu = "select user,password from Admin where user=%s and password=%s"
        v = (u, p)
        cr.execute(qu, v)
        rec = cr.fetchone()
        if rec is not None:
            qu = "update Admin set flag=1 where user=%s"
            v = (u,)
            cr.execute(qu, v)
            conn.commit()
            conn.close()
            return redirect("/admins/queries")
    else:
        qu = "select * from Register"
        cr.execute(qu)
        rec = cr.fetchall()
        for e in rec:
            if e is None:
                break
            if e[3] == u and e[4] == p:
                qu = "update Register set flag=%s where user=%s"
                v = ("1", u)
                cr.execute(qu, v)
                conn.commit()
                conn.close()
                return redirect("/home")
    conn.close()
    return redirect("/login")


def change(req):
    return render(req, "users/change.html")


def change_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    new = req.POST.get("password")
    qu = "select * from Register where flag=1"
    cr.execute(qu)
    rec = cr.fetchone()
    if rec is None:
        qu = "update Admin set password=%s where flag=1"
        v = (new,)
        cr.execute(qu, v)
        conn.commit()
        conn.close()
        return redirect("/admins/queries")
    qu = "update Register set password=%s where flag=%s"
    v = (new, "1")
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return redirect("/home")


def logout(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select user from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchone()
    if rec is not None:
        qu = "update Register set flag=%s where user=%s"
    else:
        qu = "select user from Admin where flag=1"
        cr.execute(qu)
        rec = cr.fetchone()
        qu = "update Admin set flag=%s where user=%s"
    v = ("0", rec[0])
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return redirect("/home")


def profile(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name,last_name,user,email,mobile from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    l = []
    for e in rec:
        for x in e:
            l.append(x)
    name = l[0]
    last = l[1]
    user = l[2]
    email = l[3]
    mobile = l[4]
    qu = "select country_name from Country where country_id=" \
         "(select country from Register where flag=1);"
    cr.execute(qu)
    rec = cr.fetchall()
    conn.close()
    for e in rec:
        for x in e:
            country = x
    return render(
        req,
        "users/profile.html",
        {
            "name": name,
            "last": last,
            "user": user,
            "email": email,
            "mobile": mobile,
            "country": country,
        },
    )


def edit(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name,last_name,user,email,mobile from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    l = []
    for e in rec:
        for x in e:
            l.append(x)
    name = l[0]
    last = l[1]
    user = l[2]
    email = l[3]
    mobile = l[4]
    qu = "select country_name from Country where country_id=" \
         "(select country from Register where flag=1);"
    cr.execute(qu)
    rec = cr.fetchall()
    for e in rec:
        for x in e:
            country = x
    qu = "select country_name from Country"
    cr.execute(qu)
    rec = cr.fetchall()
    lst = []
    for e in rec:
        lst.append(e[0])
    conn.close()
    return render(
        req,
        "users/edit.html",
        {
            "name": name,
            "last": last,
            "user": user,
            "email": email,
            "mobile": mobile,
            "country": country,
            "lst": lst,
        },
    )


def edit_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    user = req.POST.get("user")
    country = req.POST.get("country")
    email = req.POST.get("email")
    mobile = req.POST.get("mobile")
    qu = "select country_id from Country where country_name=%s"
    v = (country,)
    cr.execute(qu, v)
    rec = cr.fetchone()
    country = rec[0]
    qu = "update Register set user=%s, email=%s, country=%s, mobile=%s where flag=%s"
    v = (user, email, country, mobile, "1")
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return redirect("/home")


class List:
    def __init__(self):
        self.no = None
        self.item = None
        self.amount = None
        self.quantity = None

    def input(self, j, item, quantity, price):
        self.no = j
        self.item = item
        self.quantity = quantity
        self.amount = round(price, 3)


def cart(req):
    sum = 0
    tax = 0
    charges = 0
    total = 0
    empty = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select * from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    if not rec:
        conn.close()
        return redirect("/login")
    a = req.POST.get("a")
    q = req.POST.get("q")
    if q is not None:
        q = int(q)
        qu = "select cart_item,quantity from Cart where cart_item=" \
             "(select animal_id from Animal where animal_name=%s)"
        v = (a,)
        cr.execute(qu, v)
        rec = cr.fetchone()
        a = rec[0]
        cartq = rec[1]
        q += cartq
        if q == 0:
            qu = "delete from Cart where cart_item=%s"
            v = (a,)
            cr.execute(qu, v)
            conn.commit()
        else:
            qu = "update Cart set quantity=%s where cart_item=%s"
            v = (q, a)
            cr.execute(qu, v)
            conn.commit()
    qu = "select cart_item from Cart where r_id=(select r_id from Register where flag='1')"
    cr.execute(qu)
    rec = cr.fetchall()
    qu = "select quantity from Cart where r_id=(select r_id from Register where flag='1')"
    cr.execute(qu)
    recc = cr.fetchall()
    i = []
    q = []
    temp = []
    price = []
    discount = []
    o = []
    if not recc:
        empty = 1
    else:
        for e in rec:
            temp.append(e[0])
        for e in temp:
            qu = "select animal_name,price,discount from Animal where animal_id=%s"
            v = (e,)
            cr.execute(qu, v)
            rec = cr.fetchall()
            for e in rec:
                i.append(e[0])
                price.append(e[1])
                discount.append(e[2])
        for e in recc:
            q.append(e[0])
        length = len(i)
        j = 0
        while j < length:
            obj = List()
            price[j] = q[j] * (price[j] - (price[j] * (discount[j] / 100)))
            obj.input(j + 1, i[j], q[j], price[j])
            o.append(obj)
            j += 1
        for e in price:
            sum += e
        sum = round(sum, 3)
        tax = sum * (18 / 100)
        tax = round(tax, 3)
        charges = sum * (0.5 / 100)
        charges = round(charges, 3)
        total = sum + tax + charges
        total = round(total, 3)
    conn.close()
    return render(
        req,
        "order/cart.html",
        {
            "object": o,
            "empty": empty,
            "sum": sum,
            "tax": tax,
            "charges": charges,
            "total": total,
        },
    )


class Reward:
    def __init__(self):
        self.no = None
        self.coupon = None
        self.detail = None
        self.amount = None
        self.valid = None

    def input(self, e, i):
        self.no = i
        self.coupon = e[0]
        self.detail = e[1]
        self.amount = e[2]
        self.valid = e[3]


def reward(req):
    empty = 0
    o = []
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select * from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    if not rec:
        conn.close()
        return redirect("/login")
    qu = "select coupon,reward_detail,min_amount,date from " \
         "Rewards where r_id=(select r_id from Register where flag='1')"
    cr.execute(qu)
    rec = cr.fetchall()
    if not rec:
        empty = 1
    else:
        i = 1
        for e in rec:
            obj = Reward()
            obj.input(e, i)
            o.append(obj)
            i += 1
    conn.close()
    return render(req, "users/reward.html", {"reward": o, "empty": empty})


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


def order(req):
    empty = 0
    o = []
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select * from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    if not rec:
        conn.close()
        return redirect("/login")
    qu = "select order_id from Orders where r_id=(select r_id from Register where flag='1')"
    cr.execute(qu)
    rec = cr.fetchall()
    i = []
    if not rec:
        empty = 1
    else:
        for e in rec:
            i.append(e[0])
        i = list(dict.fromkeys(i))
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
            obj.input(e, data)
            o.append(obj)
    conn.close()
    return render(req, "order/order.html", {"order": o, "empty": empty})


def about(req):
    flag = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name, user from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    qu = "select species_name from Species"
    cr.execute(qu)
    recc = cr.fetchall()
    l = []
    for e in recc:
        l.append(e[0])
    conn.close()
    if rec:
        flag = 1
    if flag == 1:
        n = []
        for e in rec:
            for x in e:
                n.append(x)
        name = n[0]
        user = n[1]
        return render(
            req, "home/about.html", {"flag": flag, "name": name, "user": user, "req": l}
        )
    return render(req, "home/about.html", {"flag": flag, "req": l})


def request_help(req):
    f = req.GET.get("f")
    if f is None:
        f = 0
    print(f)
    flag = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name, user from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    qu = "select species_name from Species"
    cr.execute(qu)
    recc = cr.fetchall()
    l = []
    for e in recc:
        l.append(e[0])
    conn.close()
    if rec:
        flag = 1
    if flag == 1:
        n = []
        for e in rec:
            for x in e:
                n.append(x)
        name = n[0]
        user = n[1]
        return render(
            req,
            "home/help.html",
            {"flag": flag, "name": name, "user": user, "req": l, "f": f},
        )
    return render(req, "home/help.html", {"flag": flag, "req": l, "f": f})


def search_filter(req):
    x = req.POST.get("animal")
    if x is None:
        x = ""
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    animal = []
    qu = "select species_name from Species"
    cr.execute(qu)
    rec = cr.fetchall()
    for e in rec:
        animal.append(e[0])
    qu = "select type from Type where species=" \
         "(select species_id from Species where species_name=%s)"
    v = (x,)
    cr.execute(qu, v)
    a_type = cr.fetchall()
    final_list = []
    lst = []
    i = 0
    for r in a_type:
        if i == 0:
            lst = []
        lst.append(r)
        i += 1
        if i == 3:
            i = 0
            final_list.append(lst)
            lst = []
    if len(lst) > 0:
        final_list.append(lst)
    conn.close()
    return render(req, "search/filter.html", {"animal": animal, "x": x, "atype": final_list})


def search(req):
    flag = 0
    box = 0
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select name, user from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchall()
    qu = "select species_name from Species"
    cr.execute(qu)
    recc = cr.fetchall()
    l = []
    for e in recc:
        l.append(e[0])
    if rec:
        flag = 1
    if flag == 1:
        n = []
        for e in rec:
            for x in e:
                n.append(x)
        name = n[0]
        user = n[1]
    arec = []
    animal = req.POST.get("animal")
    catag = req.POST.get("catag")
    search = req.POST.get("search")
    kind = req.POST.getlist("kind")
    ranges = req.POST.get("ranges")
    preference = req.POST.get("preference")
    if catag is not None:
        qu = "select animal_name,price,discount,image from " \
             "Animal where species=(select species_id from Species where species_name=%s)"
        v = (catag,)
        cr.execute(qu, v)
        temp = cr.fetchall()
        for e in temp:
            e = list(e)
            e[2] = e[1] - ((e[2] / 100) * e[1])
            e[2] = round(e[2], 3)
            e = tuple(e)
            arec.append(e)
        final_list = []
        lst = []
        i = 0
        for r in arec:
            if i == 0:
                lst = []
            lst.append(r)
            i += 1
            if i == 5:
                i = 0
                final_list.append(lst)
                lst = []
        if len(lst) > 0:
            final_list.append(lst)
        if final_list:
            box = 1
    elif search is not None:
        qa = "select animal_name,price,discount,image from Animal where animal_name=%s"
        qs = "select animal_name,price,discount,image from Animal where species=" \
             "(select species_id from Species where species_name=%s)"
        qt = "select animal_name,price,discount,image from Animal where type=" \
             "(select type_id from Type where type=%s)"
        v = (search,)
        cr.execute(qa, v)
        qarec = cr.fetchall()
        cr.execute(qs, v)
        qsrec = cr.fetchall()
        cr.execute(qt, v)
        qtrec = cr.fetchall()
        if qarec:
            for e in qarec:
                e = list(e)
                e[2] = e[1] - ((e[2] / 100) * e[1])
                e[2] = round(e[2], 3)
                e = tuple(e)
                arec.append(e)
            final_list = []
            lst = []
            i = 0
            for r in arec:
                if i == 0:
                    lst = []
                lst.append(r)
                i += 1
                if i == 5:
                    i = 0
                    final_list.append(lst)
                    lst = []
            if len(lst) > 0:
                final_list.append(lst)
            if final_list:
                box = 1
        elif qsrec:
            for e in qsrec:
                e = list(e)
                e[2] = e[1] - ((e[2] / 100) * e[1])
                e[2] = round(e[2], 3)
                e = tuple(e)
                arec.append(e)
            final_list = []
            lst = []
            i = 0
            for r in arec:
                if i == 0:
                    lst = []
                lst.append(r)
                i += 1
                if i == 5:
                    i = 0
                    final_list.append(lst)
                    lst = []
            if len(lst) > 0:
                final_list.append(lst)
            if final_list:
                box = 1
        elif qtrec:
            for e in qtrec:
                e = list(e)
                e[2] = e[1] - ((e[2] / 100) * e[1])
                e[2] = round(e[2], 3)
                e = tuple(e)
                arec.append(e)
            final_list = []
            lst = []
            i = 0
            for r in arec:
                if i == 0:
                    lst = []
                lst.append(r)
                i += 1
                if i == 5:
                    i = 0
                    final_list.append(lst)
                    lst = []
            if len(lst) > 0:
                final_list.append(lst)
            if final_list:
                box = 1
        else:
            final_list = []
    elif kind != [] or ranges is not None or preference is not None:
        if kind:
            for e in kind:
                if ranges is not None and preference is not None:
                    qu = "select animal_name,price,discount,image from Animal " \
                         "where type=(select type_id from Type where type=%s) " \
                         "and price between %s and %s"
                    if ranges == "1":
                        v = (e, 0, 50)
                    elif ranges == "2":
                        v = (e, 50, 150)
                    elif ranges == "3":
                        v = (e, 150, 250)
                    else:
                        v = (e, 250, 100000)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
                    length = len(arec)
                    if preference == "low" and length > 1:
                        i = 0
                        j = 1
                        while i < length:
                            if arec[j][2] < arec[i][2]:
                                arec[j], arec[i] = arec[i], arec[j]
                            if j == length - 1:
                                break
                            i += 1
                            j += 1
                    elif preference == "high" and length > 1:
                        i = 0
                        j = 1
                        while i < length:
                            if arec[j][2] > arec[i][2]:
                                arec[j], arec[i] = arec[i], arec[j]
                            if j == length - 1:
                                break
                            i += 1
                            j += 1
                elif ranges is not None:
                    qu = "select animal_name,price,discount,image from Animal " \
                         "where type=(select type_id from Type where type=%s) " \
                         "and price between %s and %s"
                    if ranges == "1":
                        v = (e, 0, 50)
                    elif ranges == "2":
                        print("execute")
                        v = (e, 50, 150)
                    elif ranges == "3":
                        v = (e, 150, 250)
                    else:
                        v = (e, 250, 100000)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
                elif preference is not None:
                    qu = "select animal_name,price,discount,image from Animal " \
                         "where type=(select type_id from Type where type=%s)"
                    v = (e,)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
                    length = len(arec)
                    if preference == "low" and length > 1:
                        i = 0
                        j = 1
                        while i < length:
                            if arec[j][2] < arec[i][2]:
                                arec[j], arec[i] = arec[i], arec[j]
                            if j == length - 1:
                                break
                            i += 1
                            j += 1
                    elif preference == "high" and length > 1:
                        i = 0
                        j = 1
                        while i < length:
                            if arec[j][2] > arec[i][2]:
                                arec[j], arec[i] = arec[i], arec[j]
                            if j == length - 1:
                                break
                            i += 1
                            j += 1
                else:
                    qu = "select animal_name,price,discount,image from Animal " \
                         "where type=(select type_id from Type where type=%s)"
                    v = (e,)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
                final_list = []
                lst = []
                i = 0
                for r in arec:
                    if i == 0:
                        lst = []
                    lst.append(r)
                    i += 1
                    if i == 5:
                        i = 0
                        final_list.append(lst)
                        lst = []
                if len(lst) > 0:
                    final_list.append(lst)
        else:
            qu = "select species_id from Species where species_name=%s"
            v = (animal,)
            cr.execute(qu, v)
            rec = cr.fetchone()
            x = rec[0]
            if ranges is not None and preference is not None:
                if ranges is not None and preference is not None:
                    if preference == "low":
                        qu = "select animal_name,price,discount,image from Animal " \
                             "where species=%s and price between %s and %s order by price asc"
                        if ranges == "1":
                            v = (x, 0, 50)
                        elif ranges == "2":
                            v = (x, 50, 150)
                        elif ranges == "3":
                            v = (x, 150, 250)
                        else:
                            v = (x, 250, 100000)
                        cr.execute(qu, v)
                        rec = cr.fetchall()
                        for e in rec:
                            e = list(e)
                            e[2] = e[1] - ((e[2] / 100) * e[1])
                            e[2] = round(e[2], 3)
                            e = tuple(e)
                            arec.append(e)
                    else:
                        qu = "select animal_name,price,discount,image from Animal " \
                             "where species=%s and price between %s and %s order by price desc"
                        if ranges == "1":
                            v = (x, 0, 50)
                        elif ranges == "2":
                            v = (x, 50, 150)
                        elif ranges == "3":
                            v = (x, 150, 250)
                        else:
                            v = (x, 250, 100000)
                        cr.execute(qu, v)
                        rec = cr.fetchall()
                        for e in rec:
                            e = list(e)
                            e[2] = e[1] - ((e[2] / 100) * e[1])
                            e[2] = round(e[2], 3)
                            e = tuple(e)
                            arec.append(e)
            elif ranges is not None:
                qu = "select animal_name,price,discount,image from "\
                    "Animal where species=%s and price between %s and %s"
                if ranges == "1":
                    v = (x, 0, 50)
                elif ranges == "2":
                    v = (x, 50, 150)
                elif ranges == "3":
                    v = (x, 150, 250)
                else:
                    v = (x, 250, 100000)
                cr.execute(qu, v)
                rec = cr.fetchall()
                for e in rec:
                    e = list(e)
                    e[2] = e[1] - ((e[2] / 100) * e[1])
                    e[2] = round(e[2], 3)
                    e = tuple(e)
                    arec.append(e)
            elif preference is not None:
                if preference == "low":
                    qu = "select animal_name,price,discount,image "\
                        "from Animal where species=%s order by price asc"
                    v = (x,)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
                else:
                    qu = "select animal_name,price,discount,image "\
                        "from Animal where species=%s order by price desc"
                    v = (x,)
                    cr.execute(qu, v)
                    rec = cr.fetchall()
                    for e in rec:
                        e = list(e)
                        e[2] = e[1] - ((e[2] / 100) * e[1])
                        e[2] = round(e[2], 3)
                        e = tuple(e)
                        arec.append(e)
            final_list = []
            lst = []
            i = 0
            for r in arec:
                if i == 0:
                    lst = []
                lst.append(r)
                i += 1
                if i == 5:
                    i = 0
                    final_list.append(lst)
                    lst = []
            if len(lst) > 0:
                final_list.append(lst)
        if final_list:
            box = 1
    if flag == 1:
        return render(
            req,
            "search/search.html",
            {
                "flag": flag,
                "name": name,
                "user": user,
                "req": l,
                "arec": final_list,
                "box": box,
            },
        )
    return render(
        req, "search/search.html", {"flag": flag, "req": l, "arec": final_list, "box": box}
    )


def pay(req):
    amount = req.POST.get("amount")
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select address from Register where flag='1'"
    cr.execute(qu)
    rec = cr.fetchone()
    address = rec[0]
    qu = "select country_name from Country where "\
        "country_id=(select country from Register where flag='1')"
    cr.execute(qu)
    rec = cr.fetchone()
    country = rec[0]
    return render(
        req, "order/pay.html", {"amount": amount, "address": address, "country": country}
    )


def success(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select r_id,name,last_name from Register where flag=1"
    cr.execute(qu)
    r = cr.fetchone()
    name = ""
    last = ""
    i = 0
    while i < 3:
        name += r[1][i]
        i += 1
    i = 0
    while i < 3:
        last += r[2][i]
        i += 1
    qu = "select cart_item,quantity,cart_id from Cart where r_id=%s"
    v = (r[0],)
    cr.execute(qu, v)
    c = cr.fetchall()
    item = []
    citem = 0
    cquant = 0
    cid = 0
    for e in c:
        item.append(e[0])
        citem += e[0]
        cquant += e[1]
        cid += e[2]
    atype = 0
    aspecies = 0
    anative = 0
    aprice = 0
    aid = []
    for e in item:
        qu = "select type,species,native,price,animal_id from Animal where animal_id=%s"
        v = (e,)
        cr.execute(qu, v)
        rec = cr.fetchone()
        atype += rec[0]
        aspecies += rec[1]
        anative += rec[2]
        aprice += rec[3]
        aid.append(rec[4])
    today = date.today()
    d = today.strftime("%d")
    b = today.strftime("%B")
    y = today.strftime("%Y")
    m = ""
    i = 0
    while i < 3:
        m += b[i]
        i += 1
    atype = str(atype)
    aspecies = str(aspecies)
    anative = str(anative)
    aprice = int(aprice)
    aprice = str(aprice)
    citem = str(citem)
    cquant = str(cquant)
    cid = str(cid)
    r_id = str(r[0])
    order_id = (
            m
            + y
            + d
            + name
            + citem
            + cquant
            + last
            + atype
            + aspecies
            + anative
            + aprice
            + cid
            + r_id
    )
    for e in aid:
        qu = f"insert into Orders(order_id,order_detail,r_id) values('{order_id}',{e},{r[0]})"
        cr.execute(qu)
        conn.commit()
    qu = "delete from Cart where r_id=%s"
    v = (r[0],)
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return render(req, "order/success.html", {"order": order_id})


def detail(req):
    animal = req.POST.get("more")
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "select animal_name,height,weight,lifespan,price,discount,"\
        "type,image,descr from Animal where animal_name=%s"
    v = (animal,)
    cr.execute(qu, v)
    rec = cr.fetchone()
    rec = list(rec)
    rec[5] = rec[4] - ((rec[5] / 100) * rec[4])
    rec[5] = round(rec[5], 3)
    qu = "select type from Type where type_id=%s"
    v = (rec[6],)
    cr.execute(qu, v)
    temp = cr.fetchone()
    rec[6] = temp[0]
    module_dir = os.path.dirname(__file__)
    file_path = os.path.join(module_dir, rec[8])
    with open(file_path, "r") as data_file:
        descr = []
        for line in data_file:
            descr.append(line)
        data_file.close()
    conn.close()
    return render(req, "search/detail.html", {"rec": rec, "descr": descr})


def add_to_cart(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    animal = req.POST.get("addcart")
    print(animal)
    qu = "select animal_id from Animal where animal_name=%s"
    v = (animal,)
    cr.execute(qu, v)
    animal_id = cr.fetchone()
    animal_id = animal_id[0]
    qu = "select r_id from Register where flag='1'"
    cr.execute(qu)
    r_id = cr.fetchone()
    if r_id is None:
        return redirect("/login")
    r_id = r_id[0]
    qu = "select cart_id from Cart where cart_item=%s and r_id=%s"
    v = (animal_id, r_id)
    cr.execute(qu, v)
    cart_id = cr.fetchone()
    if cart_id is None:
        qu = f"insert into Cart(cart_item,r_id) values({animal_id},{r_id})"
        cr.execute(qu)
        conn.commit()
    return redirect("/cart")


def forgot(req):
    return render(req, "users/forgot.html")


def forgot_task(req):
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    user = req.POST.get("user")
    mail = req.POST.get("mail")
    qu = "select email,password,name,last_name,user from Register where user=%s and email=%s"
    v = (user, mail)
    cr.execute(qu, v)
    rec = cr.fetchone()
    mail = rec[0]
    password = rec[1]
    name = rec[2]
    last = rec[3]
    user = rec[4]
    if rec is None:
        f = 0
        return render(req, "users/forgot.html", {"f": f})
    server = smtplib.SMTP("smtp.gmail.com", 587)
    html = """
    <html>
        <body>
            <div>
                <p style="font-size:18px;">
                    Welcome <i>{0} {1}</i>!
                </p>
                <br><br>
                <p style="font-size:16px;">
                    The Password for your PetNote account <b><i>{2}</i></b> is: <b>{3}</b>
                </p>
            </div>
        </body>
    </html>""".format(
        name, last, user, password
    )
    msg = MIMEText(html, "html")
    server.starttls()
    server.login("<Enter your email(gmail)>", "<Enter password>")
    server.sendmail("<Enter your email(gmail)>", mail, msg.as_string())
    server.quit()
    return render(req, "sent.html")


def help_task(req):
    name = req.POST.get("name")
    last = req.POST.get("last")
    mail = req.POST.get("mail")
    mobile = req.POST.get("mobile")
    query = req.POST.get("query")
    conn = mysql.connect(
        host=DB_HOST, user=DB_USER, password=DB_PASS, database=DB_NAME
    )
    cr = conn.cursor()
    qu = "insert into Query(name,last_name,email,mobile,query) "\
        "values('{0}','{1}','{2}','{3}','{4}')".format(
            name, last, mail, mobile, query)
    cr.execute(qu)
    conn.commit()
    conn.close()
    return redirect("/help?f=1")


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
    server.login("<Enter your email(gmail)>", "<Enter your password>")
    server.sendmail("<Enter your email(gmail)>", rec[3], msg.as_string())
    server.quit()
    qu = "delete from Query where sno=%s"
    v = (r,)
    cr.execute(qu, v)
    conn.commit()
    conn.close()
    return redirect("/admins/queries")
