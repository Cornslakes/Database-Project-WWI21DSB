from flask import Flask, url_for, render_template, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from flask_wtf.form import _Auto
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import DataRequired
from flask_bootstrap import Bootstrap
import uuid


# -----------------------------------------------
# ------------------Basic Setup------------------
# -----------------------------------------------

app = Flask(__name__)
app.secret_key = "super secret key"
app.app_context().push()
bootstrap = Bootstrap(app)

app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://admin:123@localhost:5433/hospital"

db = SQLAlchemy(app)
from models import Medicine, Patient, Employee, Address, Place

# Routing to Home page
@app.route("/", methods=["GET", "POST"])
def index():
    title = "Welcome to your personal MyHospital - DBMS Service"
    return render_template("MyHosptial.html", title=title)


# ---------------------------------------------------------
# ------------------Functionality Patient------------------
# ---------------------------------------------------------


# -------Displaying Patient Table-------
# Routing to Patients Table
@app.route("/patient", methods=["GET", "POST"])
def patient():
    patient = Patient.query.join(Address, Address.Address_ID == Patient.Address_ID).join(Place, Address.Place_Postal_Code == Place.Place_Postal_Code).add_columns(Patient.Patient_ID, Patient.Patient_Name, Patient.Patient_Forename, Patient.Patient_Sex, Patient.Patient_Age, Patient.Patient_Birthdate, Address.Address_Street, Address.Address_HNr, Place.Place_Postal_Code, Place.Place_Name)
    return render_template("patient.html", patient=patient)


# -------Add Patient-------
# defining the Form Entry fields for Patients
class PatientForm(FlaskForm):
    name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Patient Name"},
    )
    forename = StringField(
        "Forename",
        validators=[DataRequired()],
        render_kw={"placeholder": "Patient Forename"},
    )
    choices = [
        ("M", "Male"),
        ("F", "Female"),
    ]
    sex = SelectField(
        "Sex", 
        choices=choices, 
        validators=[DataRequired()],
    )
    birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "Year-Month-Day"},
    )
    address = StringField(
        "Address",
        validators=[DataRequired()],
        render_kw={"placeholder": "Address Street"},
    )
    housenumber = StringField(
        "Housenumber",
        validators=[DataRequired()],
        render_kw={"placeholder": "Housenumber"},
    )
    postalcode = StringField(
        "Postalcode",
        validators=[DataRequired()],
        render_kw={"placeholder": "Postalcode"},
    )
    submit = SubmitField("Submit")


# Routing to the form that adds patients
@app.route("/add_patient", methods=["GET", "POST"])
def add_patient():
    title = "Insert new patient:"
    form = PatientForm()
    if form.validate_on_submit():
        patient = Patient(
            Patient_ID= uuid.uuid4(),
            Patient_Name=form.name.data,
            Patient_Forename=form.forename.data,
            Patient_Sex=form.sex.data,
            Patient_Birthdate=form.birthdate.data,
        )
        address = Address(
            Address_ID = uuid.uuid4(),
            Address_Street = form.address.data,
            Address_HNr = form.housenumber.data,
            Place_Postal_Code = form.postalcode.data,
        )
        patient.Address_ID = address.Address_ID
        db.session.add(patient)
        db.session.add(address)
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/patient")
    return render_template("add_entity.html", form=form, title=title)


# -------Delete Patient-------
# Routing to delete functionality for patients
@app.route("/delete_patient/<id>")
def delete_patient(id):
    patient = Patient.query.filter_by(Patient_ID=id).first()
    if patient:
        msg_text = (
            "Patient "
            + patient.Patient_Name
            + ", "
            + patient.Patient_Forename
            + "     was successfully removed."
        )
        db.session.delete(patient)
        db.session.commit()
        flash(msg_text)
    return redirect("/patient")


# -------Change Patient Info-------
class ChangePatientForm(FlaskForm):
    Patient_Name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Patient Name"}
    )
    Patient_Forename = StringField(
        "Forename",
        validators=[DataRequired()],
        render_kw={"placeholder": "Patient Forename"},
    )
    choices = [
        ("M", "Male"),
        ("F", "Female"),
    ]
    Patient_Sex = SelectField(
        "Sex", 
        choices=choices, 
        validators=[DataRequired()],
    )
    Patient_Birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "Year-Month-Day"},
    )
    Address_Street = StringField(
        "Address",
        validators=[DataRequired()],
        render_kw={"placeholder": "Address Street"},
    )
    Address_HNr = StringField(
        "Housenumber",
        validators=[DataRequired()],
        render_kw={"placeholder": "Housenumber"},
    )
    Place_Postal_Code = StringField(
        "Postal Code",
        validators=[DataRequired()],
        render_kw={"placeholder": "Postal Code"},
    )

    submit = SubmitField("Submit")


# Routing to the form that changes patients
@app.route("/change_patient/<id>", methods=["GET", "POST"])
def change_patient(id):
    title = "Change patient info:"
    # Query for retrieving all relevant patient info
    patientdetails = Patient.query.filter_by(Patient_ID=id).join(Address, Address.Address_ID == Patient.Address_ID).join(Place, Address.Place_Postal_Code == Place.Place_Postal_Code).add_columns(Patient.Patient_ID, Patient.Patient_Name, Patient.Patient_Forename, Patient.Patient_Sex, Patient.Patient_Birthdate, Address.Address_Street, Address.Address_HNr, Place.Place_Postal_Code).first()
    addressid = Patient.query.filter_by(Patient_ID=id).add_columns(Patient.Address_ID).first()
    patient = Patient.query.filter_by(Patient_ID=id).first()
    address = Address.query.filter_by(Address_ID = addressid.Address_ID).first()
    form = ChangePatientForm(obj=patientdetails)

    if form.validate_on_submit():
        patient.Patient_Name=form.Patient_Name.data
        patient.Patient_Forename=form.Patient_Forename.data
        patient.Patient_Sex=form.Patient_Sex.data
        patient.Patient_Birthdate=form.Patient_Birthdate.data
        address.Address_Street = form.Address_Street.data
        address.Address_HNr = form.Address_HNr.data
        address.Place_Postal_Code = form.Place_Postal_Code.data
        db.session.commit()
        session["known"] = False
        session["name"] = form.Patient_Name.data
        return redirect("/patient")
    return render_template("change_entity.html", form=form, title=title)


# ---------------------------------------------------------
# ------------------Functionality Medicine-----------------
# ---------------------------------------------------------


# -------Displaying Medicine Table-------
@app.route("/medicine")
def medicine_stock():
    title = "List of current medicine stock:"
    medicine = Medicine.query.order_by(Medicine.Medicine_Name.desc()).all()
    return render_template("medicine.html", medicine=medicine)


# -------Add Medicine-------
# defining the Form Entry fields for Medicines
class MedicineForm(FlaskForm):
    name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Medicine name"},
    )
    price = StringField(
        "Price",
        validators=[DataRequired()],
        render_kw={"placeholder": "Price"},
    )
    amount = StringField(
        "Amount",
        validators=[DataRequired()],
        render_kw={"placeholder": "Stock"},
    )
    submit = SubmitField("Submit")


# Routing to the form that adds medicines
@app.route("/add_medicine", methods=["GET", "POST"])
def add_medicine():
    title = "Add new medicine:"
    form = MedicineForm()
    if form.validate_on_submit():
        medicine = Medicine.query.filter_by(Medicine_Name=form.name.data).first()
        if medicine is None:
            medicine = Medicine(
                Medicine_ID=uuid.uuid4(),
                Medicine_Name=form.name.data,
                Medicine_Pricing=form.price.data,
                Medicine_Amount=form.amount.data,
            )
            db.session.add(medicine)
            db.session.commit()
            session["known"] = False
        else:
            session["known"] = True
        session["name"] = form.name.data
        return redirect("/medicine")
    return render_template("add_entity.html", form=form, title=title)


# -------Delete Medicine-------
# Routing to Delete functionality for medicines
@app.route("/delete_medicine/<id>")
def delete_medicine(id):
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()
    if patient:
        msg_text = "Medicine %s was successfully removed." % str(medicine.Medicine_Name)
        db.session.delete(medicine)
        db.session.commit()
        flash(msg_text)
    return redirect("/medicine")


# Functionality for the cancel button in the Medicine order tab
@app.route("/cancel_medicine_order")
def cancel_medicine_order():
    return redirect("/medicine")


# -------Change Medicine-------
class ChangeMedicineForm(FlaskForm):
    Medicine_Name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Name"},
    )
    Medicine_Pricing = StringField(
        "Price",
        validators=[DataRequired()],
        render_kw={"placeholder": "Price"},
    )
    Medicine_Amount = StringField(
        "Amount",
        validators=[DataRequired()],
        render_kw={"placeholder": "Amount"},
    )
    submit = SubmitField("Submit")


# Routing to the form that changes medicines
@app.route("/change_medicine/<id>", methods=["GET", "POST"])
def change_medicine(id):
    title = "Change medicine info:"
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()
    form = ChangeMedicineForm(obj = medicine)

    if form.validate_on_submit():
        if (
            form.Medicine_Name.data
            in [medication.Medicine_Name for medication in Medicine.query.all()]
            and form.Medicine_Name.data != medicine.Medicine_Name
        ):
            flash(
                "Error: sorry it doenst work but the problem is that you know that the name you are trying to rename this this is already in stock no i meant that the name in in the table already exists, so it exists and that is why you cant create another if you doidnt understand that i dindt understand too, but just try it again with a different name. \n by the way, Did you know that the answer to life is 42?"
            )
        if (int(form.Medicine_Amount.data) < 0 or int(form.Medicine_Amount.data) > 10):
            msg_text = "Error: You entered an invalid amount of %s, please try again." % str(medicine.Medicine_Name)
            flash(msg_text)
        else:
            medicine.Medicine_Name = form.Medicine_Name.data
            medicine.Medicine_Pricing = form.Medicine_Pricing.data
            medicine.Medicine_Amount = form.Medicine_Amount.data
            db.session.commit()
            session["known"] = False
            session["name"] = form.Medicine_Name.data
        return redirect("/medicine")
    return render_template("change_entity.html", form=form, title=title)


# -------Medicine stock -1 functionality-------
@app.route("/stock_minus_one/<id>", methods=["GET", "POST"])
def stock_minus_one(id):
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()
    if medicine.Medicine_Amount > 0:
        medicine.Medicine_Amount -= 1
        db.session.commit()
    else:
        flash("Error: Minimum stock is 0.")
    return redirect("/medicine")


class RestockingMedicineForm(FlaskForm):
    submit = SubmitField("Place order")


# -------restock medicine-------
# derives a bill and fills all medicine stocks up to 10
@app.route("/restock_medicine", methods=["GET", "POST"])
def restock_medicine():
    form = RestockingMedicineForm()
    medicines = Medicine.query.all()
    names = []
    restocking_amounts = []
    restocking_prices = []
    companys = []
    ids = []
    total = 0
    for medication in medicines:
        name = medication.Medicine_Name
        restock_amount = 10 - medication.Medicine_Amount
        restocking_price = float(medication.Medicine_Pricing[1:]) * restock_amount
        if restock_amount > 0:
            ids.append(medication.Medicine_ID)
            names.append(name)
            restocking_amounts.append(restock_amount)
            restocking_prices.append("$" + str(restocking_price))
            total += restocking_price
    if total == 0:
        flash("Error: There is nothing to restock.")
        return redirect("/medicine")

    if form.validate_on_submit():
        for medicine in medicines:
            medicine.Medicine_Amount = 10
            db.session.commit()
        restock_message = ""
        for name in names:
            restock_message += name + ", "
        flash(
            "Successfully restocked: "
            + restock_message[:-2]
            + " for a total of    "
            + str(total)
            + "$"
        )
        return redirect("/medicine")

    return render_template(
        "restock_medicine.html",
        names=names,
        amounts=restocking_amounts,
        prices=restocking_prices,
        companys=companys,
        total="$" + str(total),
        form=form,
    )


# ---------------------------------------------------------
# ------------------Functionality Employee-----------------
# ---------------------------------------------------------


@app.route("/staff")
def employee_staff():
    employee = Employee.query.join(Address, Address.Address_ID == Employee.Address_ID).join(Place, Address.Place_Postal_Code == Place.Place_Postal_Code).add_columns(Employee.Employee_ID, Employee.Employee_Name, Employee.Employee_Forename, Employee.Employee_Birthdate, Employee.Employee_Salary, Employee.Employee_Role, Address.Address_Street, Address.Address_HNr, Place.Place_Postal_Code, Place.Place_Name)
    return render_template("employee.html", employee=employee)


# -------Add Employee-------
# defining the Form Entry fields for Employees
class EmployeeForm(FlaskForm):
    name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Employee Name"},
    )
    forename = StringField(
        "Forename",
        validators=[DataRequired()],
        render_kw={"placeholder": "Employee Forename"},
    )
    birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "Year-Month-Day"},
    )
    salary = StringField(
        "Salary",
        validators=[DataRequired()],
        render_kw={"placeholder": "Amount in USD"},
    )
    # Define the choices for the dropdown menu
    choices = [
        ("Doctor", "Doctor"),
        ("Nurse", "Nurse"),
    ]
    role = SelectField(
        "Role",
        choices=choices,
          validators=[DataRequired()]
    )
    address = StringField(
        "Address",
        validators=[DataRequired()],
        render_kw={"placeholder": "Address Street"},
    )
    housenumber = StringField(
        "Housenumber",
        validators=[DataRequired()],
        render_kw={"placeholder": "Housenumber"},
    )
    postalcode = StringField(
        "Postalcode",
        validators=[DataRequired()],
        render_kw={"placeholder": "Postalcode"},
    )

    submit = SubmitField("Submit")


# Routing to the form that adds Employees
@app.route("/add_employee", methods=["GET", "POST"])
def add_employee():
    title = "Add new medicine:"
    form = EmployeeForm()
    if form.validate_on_submit():
        employee = Employee(
            Employee_ID=uuid.uuid4(),
            Employee_Name=form.name.data,
            Employee_Forename=form.forename.data,
            Employee_Birthdate=form.birthdate.data,
            Employee_Salary=form.salary.data,
            Employee_Role=form.role.data,
        )
        address = Address(
            Address_ID = uuid.uuid4(),
            Address_Street = form.address.data,
            Address_HNr = form.housenumber.data,
            Place_Postal_Code = form.postalcode.data,
        )
        employee.Address_ID = address.Address_ID
        db.session.add(employee)
        db.session.add(address)
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/staff")
    return render_template("add_entity.html", form=form, title=title)


# -------Delete Employee-------
# Routing to Delete functionality for Employees
@app.route("/delete_employee/<id>")
def delete_employee(id):
    employee = Employee.query.filter_by(Employee_ID=id).first()
    if patient:
        msg_text = (
            "Employee "
            + employee.Employee_Name
            + ", "
            + employee.Employee_Forename
            + "     was successfully removed."
        )
        db.session.delete(employee)
        db.session.commit()
        flash(msg_text)
    return redirect("/staff")


class ChangeEmployeeForm(FlaskForm):
    Employee_Name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Employee Name"},
    )
    Employee_Forename = StringField(
        "Forename",
        validators=[DataRequired()],
        render_kw={"placeholder": "Employee Forename"},
    )
    Employee_Birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "Year-Month-Day"},
    )
    Employee_Salary = StringField(
        "Salary in USD",
        validators=[DataRequired()],
        render_kw={"placeholder": " e.g. 8000.30"},
    )
    choices = [
        ("Doctor", "Doctor"),
        ("Nurse", "Nurse"),
    ]
    Employee_Role = SelectField(
        "Role", 
        choices=choices, 
        validators=[DataRequired()]
    )
    Address_Street = StringField(
        "Address",
        validators=[DataRequired()],
        render_kw={"placeholder": "Address Street"},
    )
    Address_HNr = StringField(
        "Housenumber",
        validators=[DataRequired()],
        render_kw={"placeholder": "Housenumber"},
    )
    Place_Postal_Code = StringField(
        "Postal Code",
        validators=[DataRequired()],
        render_kw={"placeholder": "Postal Code"},
    )

    submit = SubmitField("Submit")


# Routing to the form that changes Employees
@app.route("/change_employee/<id>", methods=["GET", "POST"])
def change_employee(id):
    title = "Change employee info:"
    employeedetails = Employee.query.filter_by(Employee_ID=id).join(Address, Address.Address_ID == Employee.Address_ID).join(Place, Address.Place_Postal_Code == Place.Place_Postal_Code).add_columns(Employee.Employee_ID, Employee.Employee_Name, Employee.Employee_Forename, Employee.Employee_Birthdate, Employee.Employee_Salary, Employee.Employee_Role, Address.Address_Street, Address.Address_HNr, Place.Place_Postal_Code).first()
    addressid = Employee.query.filter_by(Employee_ID=id).add_columns(Employee.Address_ID).first()
    employee = Employee.query.filter_by(Employee_ID=id).first()
    address = Address.query.filter_by(Address_ID = addressid.Address_ID).first()
    form = ChangeEmployeeForm(obj=employeedetails)

    if form.validate_on_submit():
        employee.Employee_Name=form.Employee_Name.data
        employee.Employee_Forename=form.Employee_Forename.data
        employee.Employee_Birthdate=form.Employee_Birthdate.data
        employee.Employee_Salary=form.Employee_Salary.data
        employee.Employee_Role=form.Employee_Role.data
        address.Address_Street = form.Address_Street.data
        address.Address_HNr = form.Address_HNr.data
        address.Place_Postal_Code = form.Place_Postal_Code.data
        db.session.commit()
        session["known"] = False
        session["name"] = form.Employee_Name.data
        return redirect("/staff")
    return render_template("change_entity.html", form=form, title=title)

#-------------------OTHER-------------------

if __name__ == "main":
    app.run(host="0.0.0.0", port=5000)
