
from flask import Flask,render_template,request,session,redirect,url_for,flash
#render_template is for directly importing a html file 
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin                                    
#by using flask login we get the current user and we set a password and extract current user who is into our session
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
from flask_mail import Mail
import json

with open('config.json','r') as c:
     params=json.load(c)["params"]
  
     
     
#setting local service
#my db connection
local_server=True
app = Flask(__name__)
#flask sql alchemy which enables to connect frontend and the backend
app.secret_key='varsha'


 #SMTP MAIL SERVER SETTINGS
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT=465,  # Port 465 for SSL
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)

mail=Mail(app)
     

#this is for getting unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'

@login_manager.user_loader
def local_user(user_id):
    return User.query.get(int(user_id))




#configuring sql settings, i.e  loading  hms to main.py
#app.config['SQLALCHEMY_DATABASE_URL']='mysql://username:password@localhost/database_table_name'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/hms'
db=SQLAlchemy(app)


# Define your model to match the existing table structure
class Test(db.Model):
    __tablename__ = 'test'  # Specify the table name explicitly 
    id=db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(100))  # Assuming 'name' is the primary key(mandatory)
    email = db.Column(db.String(100))
    
class User(UserMixin,db.Model):
      id=db.Column(db.Integer,primary_key=True)
      username = db.Column(db.String(50))
      email = db.Column(db.String(50),unique=True)
      password=db.Column(db.String(1000))
      #we will hash the password in to **user mixing** function  , we encrypt the password and when user enter password ,the original password get decripted and checks with the password

class Patients(db.Model):
    pid=db.Column(db.Integer,primary_key=True)  
    email=db.Column(db.String(50))
    name=db.Column(db.String(50))
    gender=db.Column(db.String(50))
    slot=db.Column(db.String(50))
    disease=db.Column(db.String(50))
    time=db.Column(db.String(50),nullable=False)
    date=db.Column(db.String(50),nullable=False)
    dept=db.Column(db.String(50))
    number=db.Column(db.String(12))
    
class Doctors(db.Model):
     did=db.Column(db.Integer,primary_key=True) 
     email=db.Column(db.String(50))
     doctorname=db.Column(db.String(50))
     dept=db.Column(db.String(100))
     
class Triggr(db.Model):
     tid=db.Column(db.Integer,primary_key=True) 
     pid=db.Column(db.Integer) 
     email=db.Column(db.String(50))
     name=db.Column(db.String(50))
     action=db.Column(db.String(50))     
     timestamp=db.Column(db.String(50))
     

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/doctors',methods=['POST','GET'])
def doctors():
     if request.method=="POST":
        email=request.form.get('email')
        doctorname=request.form.get('doctorname')
        dept=request.form.get('dept')
        query=Doctors(email=email,doctorname=doctorname,dept=dept)
        db.session.add(query)
        db.session.commit()
        flash("Information is Stored","primary")
    
     return render_template('doctors.html')

@app.route('/patients', methods=['POST', 'GET'])
@login_required
def patient():
    # Use the session to query all doctors
    doct = db.session.query(Doctors).all()

    if request.method == "POST":
        email = request.form.get('email')
        name = request.form.get('name')
        gender = request.form.get('gender')
        slot = request.form.get('slot')
        disease = request.form.get('disease')
        time = request.form.get('time')
        date = request.form.get('date')
        dept = request.form.get('dept')
        number = request.form.get('number')

        query = Patients(email=email, name=name, gender=gender, slot=slot, disease=disease, time=time, date=date, dept=dept, number=number)
        db.session.add(query)
        db.session.commit()

        # Log recipient email for debugging
        recipient_email = email
        print(f"Sending email to: {recipient_email}")

        try:
            mail.send_message(
                'HOSPITAL MANAGEMENT SYSTEM',
                sender=params['gmail-user'],
                recipients=[recipient_email],  # Ensure recipients is a list
                body='Your Booking is confirmed. Thanks for choosing us!!'
            )
            flash("Booking Confirmed", "info")
        except Exception as e:
            flash(f"Failed to send confirmation email: {str(e)}", "danger")
    
    return render_template('patient.html', doct=doct)

@app.route('/bookings')
@login_required
def booking():
    em=current_user.email
    query = Patients.query.filter_by(email=em).all()
    return render_template('bookings.html', query=query)


@app.route('/edit/<int:pid>', methods=['POST', 'GET'])
@login_required
def edit(pid):
    user = Patients.query.filter_by(pid=pid).first()
    if not user:
        flash("User not found", "danger")
        return redirect(url_for('booking'))
    
    if request.method == "POST":
        email = request.form.get('email')
        name = request.form.get('name')
        gender = request.form.get('gender')
        slot = request.form.get('slot')
        disease = request.form.get('disease')
        time = request.form.get('time')
        date = request.form.get('date')
        dept = request.form.get('dept')
        number = request.form.get('number')

        user.name = name
        user.email = email
        user.gender = gender
        user.slot = slot
        user.disease = disease
        user.time = time
        user.date = date
        user.dept = dept
        user.number = number

        try:
            db.session.commit()
            flash("Slot is Updated Successfully", "success")
        except Exception as e:
            db.session.rollback()
            flash(f"An error occurred: {str(e)}", "danger")
        
        return redirect(url_for('booking'))

    return render_template('edit.html', user=user)


@app.route('/delete/<int:pid>', methods=['POST'])
@login_required
def delete(pid):
    # Query the record with the given pid
    record = Patients.query.filter_by(pid=pid).first()

    if record:
        db.session.delete(record)  # Delete the record
        db.session.commit()  # Commit the transaction
        flash("Record deleted successfully", "success")
    else:
        flash("Record not found", "danger")

    return redirect(url_for('booking'))








@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method=="POST":
        username=request.form.get('username')
        email=  request.form.get('email') 
        password=request.form.get('password')
        #print(username,email,password)
       # Check if the user already exists using ORM
        user = User.query.filter_by(email=email).first()
        
        if user:
            flash("Email Already Exists","warning")
            return render_template('signup.html')
        
        # Hash the password
        hashed_password = generate_password_hash(password)
        
        # Create a new user instance
        new_user = User(username=username, email=email, password=hashed_password)
        
        # Add and commit the new user to the database
        db.session.add(new_user)
        db.session.commit()
        flash("Signup Success Please Login "," Success")
        return render_template('login.html')
    return render_template('signup.html')
#Engine: Manages the database connection and is used internally by both Core and ORM
#Session: Used to interact with the database in the context of ORM, handling transactions and object persistence.
#SQLAlchemy's ORM provides a higher-level abstraction that allows you to map Python classes to database table
#Session: Works with ORM models, allowing you to interact with the database using Python objects. It abstracts away raw SQL and provides a more Pythonic way to perform CRUD (Create, Read, Update, Delete) operations.
#Engine: Does not directly interact with ORM models. It executes raw SQL and is generally used for lower-level database operations.

@app.route('/login',methods=['POST','GET'])
def login():
    if request.method=="POST":
        email=  request.form.get('email') 
        password=request.form.get('password')
        #print(email,password)
        user=User.query.filter_by(email=email).first()
        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("Login Success","primary")
            return redirect(url_for('index'))
        else:
            flash("invalid_credentials","danger")
            
            return render_template('login.html')
    
    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("logout SuccessFul","Warning")
    return redirect(url_for('login'))



@app.route('/search',methods=['POST','GET'])
@login_required
def search():
    if request.method=="POST":
       q=request.form.get('search')
       dept=Doctors.query.filter_by(dept=q).first()
       name=Doctors.query.filter_by(doctorname=q).first()
       if dept or name :
          flash("Doctor is Available","info")
       else :
          flash("Doctor is not Available","danger") 
             
    return render_template('index.html')          

@app.route('/details')
@login_required
def details():
    posts=Triggr.query.all()
    return render_template('triggers.html',posts=posts)


@app.route('/home')
def home():
    return "This is my home"

if __name__ == '__main__':
    app.run(debug=True)
