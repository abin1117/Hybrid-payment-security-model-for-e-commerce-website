from flask import *
from database import *

user=Blueprint('user',__name__)

@user.route('/userhome')
def userhomepage():
    return render_template('user.html')

@user.route('/userviewshop')
def userviewshop():
    data={}
    qry20="select * from shops inner join login using(login_id)"
    data['shops']=select(qry20)
    return render_template('userviewshop.html',data=data)


@user.route('/userviewproduct')
def userviewproduct():
    data={}
    qry21="select * from products"
    data['product']=select(qry21)
    if 'search' in request.form:
        search=request.form['search']

        qry="SELECT * FROM products WHERE product_name  like '%s'"%(search)
        select(qry)
    return render_template('userviewproduct.html',data=data)


@user.route('/vieworderstatus')
def vieworderstatus():
    data={}
    qry2="select * from order_master"
    data['order_master']=select(qry2)
    return render_template('vieworderstatus.html',data=data)

@user.route('/sendcomplaints',methods=['post','get'])
def sendcomplaints():
     if 'send' in request.form:
        complaint=request.form['complaints']

        qry="insert into complaints values(null,'%s','%s','pending',curdate())"%(session['uid'],complaint)
        insert(qry)
     data={}
     qry2="select * from complaints"
     data['complaints']=select(qry2)
     return render_template('sendcomplaints.html',data=data)

# @user.route('/search',methods=['post','get'])
# def search():
#     if 'search' in request.form:
#         search=request.form['search']

#         qry="SELECT * FROM products WHERE product_name  like '%s'"%(search)
#         select(qry)

#     return render_template('userviewproduct.html')   