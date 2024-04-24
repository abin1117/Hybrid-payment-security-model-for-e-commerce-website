from flask import*
from database import *

admin=Blueprint('admin',__name__)

@admin.route('/adminhome')
def adminhomepage():
    return render_template('admin.html')

@admin.route('/viewshop')
def viewshop():
    data={}
    qry="select * from shops inner join login using(login_id)"
    data['shop']=select(qry)
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
    else:
        action=None
    if action=='reject':
        qry="update login set user_type='rejected'where login_id='%s'"%(id)
        update(qry)
    if action=='accept':
        qry="update login set user_type='shop'where login_id='%s'"%(id)
        update(qry)  
    return render_template('viewshop.html',data=data)

@admin.route('/productcategory',methods=['post','get'])
def productcategory(): 
    qry2="select * from product_category"
    data={}
    data['productcategory']=select(qry2)


    if 'productcategory' in request.form:
        categoryname=request.form['category']
        qry="insert into product_category values(null,'%s') "%(categoryname)
        insert(qry)

    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']


            
        if action=='delete':
            qry="delete from product_category where category_id='%s'"%(id)
            delete(qry) 


        if action=='update':
            qry8="select * from product_category where category_id='%s'"%(id)
            data['up']=select(qry8)

        if 'update' in request.form:
            catname=request.form['category']

            qry3="update product_category set  category_name='%s' where category_id='%s'"%(catname,id)
            update(qry3)

            

    return render_template('productcategory.html',data=data)

@admin.route('/viewproduct')
def viewproduct():

    data={}
    qry5="select * from products"
    re=select(qry5)
    print(re)
    data['products']=re
    return render_template('viewproduct.html',data=data)

@admin.route('/viewstock')
def viewstock():

    data={}
    qry4="select * from stocks"
    data['stocks']=select(qry4)
    
    
    return render_template('viewstock.html',data=data)

@admin.route('/users')
def users():

    data={}
    qry6="select * from users"
    data['users']=select(qry6)
    
    return render_template('viewcustomer.html',data=data)

@admin.route('/complaints')
def complaints(): 

    data={}
    qry7="select * from complaints"
    data['complaints']=select(qry7)

    return render_template('viewcomplaint.html',data=data)
    
@admin.route('/sendreply',methods=['post','get'])
def sendreply():
    id=request.args['id']

    data={}
    qry10="select * from complaints"
    data['complaints']=select(qry10)

    if 'reply' in request.form:
        reply=request.form['reply1']
        qry="update complaints set reply='%s' where complaint_id='%s'"%(reply,id)
        update(qry)


    return render_template('sendreply.html')   