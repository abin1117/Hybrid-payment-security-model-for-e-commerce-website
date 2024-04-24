from flask import *
from database import *
import uuid

shop=Blueprint('shop',__name__)

@shop.route('/shophome')
def shophomepage():
    return render_template('shop.html')

@shop.route('/viewproductcategory')
def productcategory():
    data={}
    qry12="select * from product_category"
    
    data['product_categoryy']=select(qry12)

    return render_template('viewproductcategory.html',data=data)

@shop.route('/manageproduct',methods=['GET','POST'])
def manageproduct():
    data={}
    qr="select * from product_category"
    res=select(qr)
    data['pc']=res
    print(res)

    qry15="select * from products"
    data['products']=select(qry15)

    if 'manageproduct' in request.form:
        product_name=request.form['product_name']
        details=request.form['details']
        price=request.form['price']
        image=request.files['image']
        path='static/'+str(uuid.uuid4())+image.filename
        image.save(path)
        category_id=request.form['cat']

        qry14="insert into products values(null,'%s','%s','%s','%s','%s','%s')"%(category_id,session['sid'],product_name,details,price,path)
        insert(qry14)

        return '''<script>alert("Added");window.location="/manageproduct"</script>'''

    

    return render_template('manageproduct.html',data=data)   

@shop.route('/updatestock',methods=['GET','POST'])
def updatestock():
    data={}
    id=request.args['id']
    qry16="select * from products"
    data['products']=select(qry16)

    if 'updatestock' in request.form:
        quantity=request.form['quantity']

        qry18="insert into stocks values(null,'%s','%s',now())"%(id,quantity)
        insert(qry18)

    return render_template('stockupdateform.html',data=data)


@shop.route('/vieworders')
def vieworders():

    data={}
    qry17="select * from order_details"
    data['order_details']=select(qry17)

    return render_template('vieworders.html',data=data)

@shop.route('/viewrating')
def viewrating():

    data={}
    qry19="select * from ratings"
    data['ratings']=select(qry19)

    return render_template('viewrating.html',data=data)
    
    


    


    
       
      