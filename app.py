from flask import Flask, url_for, render_template, session, redirect, flash
from sqlalchemy.orm import joinedload
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from flask_wtf.form import _Auto
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import DataRequired
from flask_bootstrap import Bootstrap
import os
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


@app.route("/", methods=["GET", "POST"])
def index():
    title = "great things comming soon"
    return render_template("MyHosptial.html", title=title)


# ---------------------------------------------------------
# ------------------Functionality Patient------------------
# ---------------------------------------------------------


# -------Displaying Patient Table-------
# Routing to Patients Table
@app.route("/patient", methods=["GET", "POST"])
def patient():
    title = "List of patients:"
    patient = Patient.query.order_by(Patient.Patient_Name.desc()).all()
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
    # Define the choices for the dropdown menu
    choices = [
        ("M", "Male"),
        ("F", "Female"),
    ]
    sex = SelectField("Sex", choices=choices, validators=[DataRequired()])
    birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "year-month-day"},
    )

    submit = SubmitField("Submit")


# Routing to the form that adds patients
@app.route("/add_patient", methods=["GET", "POST"])
def add_patient():
    form = PatientForm()
    if form.validate_on_submit():
        patient = Patient(
            Patient_ID=uuid.uuid4(),
            Patient_Name=form.name.data,
            Patient_Forename=form.forename.data,
            Patient_Sex=form.sex.data,
            Patient_Birthdate=form.birthdate.data,
        )
        db.session.add(patient)
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/patient")
    return render_template("add_entity.html", form=form)


# -------Delete Patient-------
# Routing to delete functionality for patients
@app.route("/delete_patient/<id>")
def delete_patient(id):
    patient = Patient.query.filter_by(Patient_ID=id).first()
    if patient:
        msg_text = "Patient %s successfully removed" % str(patient)
        db.session.delete(patient)
        db.session.commit()
        flash(msg_text)
    return redirect("/patient")


# -------Change Patient Info-------
class ChangePatientForm(FlaskForm):
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
    # Define the choices for the dropdown menu
    choices = [
        ("M", "Male"),
        ("F", "Female"),
    ]
    sex = SelectField("Sex", choices=choices, validators=[DataRequired()])
    birthdate = StringField(
        "Birthdate",
        validators=[DataRequired()],
        render_kw={"placeholder": "year-month-day"},
    )

    submit = SubmitField("Submit")


# Routing to the form that changes patients
@app.route("/change_patient/<id>", methods=["GET", "POST"])
def change_patient(id):
    form = ChangePatientForm()
    patient = Patient.query.filter_by(Patient_ID=id).first()

    if form.validate_on_submit():
        patient.Patient_Name = form.name.data
        patient.Patient_Forename = form.forename.data
        patient.Patient_Sex = form.sex.data
        patient.Patient_Birthdate = form.birthdate.data
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/patient")
    return render_template("change_patient.html", form=form, patient=patient)


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
    return render_template("add_entity.html", form=form)


# -------Delete Medicine-------
# Routing to Delete functionality for medicines
@app.route("/delete_medicine/<id>")
def delete_medicine(id):
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()
    if patient:
        msg_text = "Medicine %s successfully removed" % str(medicine)
        db.session.delete(medicine)
        db.session.commit()
        flash(msg_text)
    return redirect("/medicine")


# functionality for the cancel button in the Medicine order tab
@app.route("/cancel_medicine_order")
def cancel_medicine_order():
    return redirect("/medicine")


# -------Change Medicine-------
class ChangeMedicineForm(FlaskForm):
    name = StringField(
        "Name",
        validators=[DataRequired()],
        render_kw={"placeholder": "Name"},
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


# Routing to the form that changes medicines
@app.route("/change_medicine/<id>", methods=["GET", "POST"])
def change_medicine(id):
    form = ChangeMedicineForm()
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()

    if form.validate_on_submit():
        if (
            form.name.data
            in [medication.Medicine_Name for medication in Medicine.query.all()]
            and form.name.data != medicine.Medicine_Name
        ):
            flash(
                "Error: sorry it doenst work but the problem is that you know that the name you are trying to rename this this is already in stock no i meant that the name in in the table already exists, so it exists and that is why you cant create another if you doidnt understand that i dindt understand too, but just try it again with a different name. \n by the way, Did you know that the answer to life is 42?"
            )
        else:
            medicine.Medicine_Name = form.name.data
            medicine.Medicine_Pricing = form.price.data
            medicine.Medicine_Amount = form.amount.data
            db.session.commit()
            session["known"] = False
            session["name"] = form.name.data
        return redirect("/medicine")
    return render_template("change_medicine.html", form=form, medicine=medicine)


# -------Stock -1-------
@app.route("/stock_minus_one/<id>", methods=["GET", "POST"])
def stock_minus_one(id):
    medicine = Medicine.query.filter_by(Medicine_ID=id).first()
    if medicine.Medicine_Amount > 0:
        medicine.Medicine_Amount -= 1
        db.session.commit()
    else:
        flash("Error: Minimum stock is 0")
    return redirect("/medicine")


class RestockingMedicineForm(FlaskForm):
    submit = SubmitField("Place Order")


# -------restock medicine-------
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
            companys.append("Company")
            total += restocking_price
    if total == 0:
        flash("there is nothing to restock")
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
    title = "List of all staffed employees:"
    employee = Employee.query.order_by(Employee.Employee_Name.desc()).all()
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
        render_kw={"placeholder": "year-month-day"},
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
    role = SelectField("Role", choices=choices, validators=[DataRequired()])

    submit = SubmitField("Submit")


# Routing to the form that adds Employees
@app.route("/add_employee", methods=["GET", "POST"])
def add_employee():
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
        db.session.add(employee)
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/staff")
    return render_template("add_entity.html", form=form)


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
            + "     successfully removed"
        )
        db.session.delete(employee)
        db.session.commit()
        flash(msg_text)
    return redirect("/staff")


class ChangeEmployeeForm(FlaskForm):
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
        render_kw={"placeholder": "year-month-day"},
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
    role = SelectField("Role", choices=choices, validators=[DataRequired()])

    submit = SubmitField("Submit")


# Routing to the form that changes Employees
@app.route("/change_employee/<id>", methods=["GET", "POST"])
def change_employee(id):
    form = ChangeEmployeeForm()
    employee = Employee.query.filter_by(Employee_ID=id).first()

    if form.validate_on_submit():
        employee.Employee_Name = form.name.data
        employee.Employee_Forename = form.forename.data
        employee.Employee_Birthdate = form.birthdate.data
        employee.Employee_Salary = form.salary.data
        employee.Employee_Role = form.role.data
        db.session.commit()
        session["known"] = False
        session["name"] = form.name.data
        return redirect("/staff")
    return render_template("change_employee.html", form=form, employee=employee)


## ------------- OTHER --------------- ###


@app.route("/check")
def check():
    patient = get_place_name("c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a")
    flash(str(patient))


def get_place_name(patient_uuid):
    patient = db.session.query(Patient).join(Address)

    if patient:
        return patient.place.Place_Name
    else:
        return None
