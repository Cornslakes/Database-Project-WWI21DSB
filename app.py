from flask import Flask, url_for, render_template, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
from flask_bootstrap import Bootstrap
import os
import uuid

app = Flask(__name__)
app.secret_key = "super secret key"
app.app_context().push()
bootstrap = Bootstrap(app)

app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://admin:123@localhost:5433/hospital"

db = SQLAlchemy(app)
from models import Medicine, Patient


@app.route("/", methods=["GET", "POST"])
def index():
    title = "List of patients:"
    patient = Patient.query.order_by(Patient.Patient_Name.desc()).all()
    return render_template("patient.html", patient=patient)


@app.route("/medicine")
def medicine_stock():
    title = "List of current medicine stock:"
    medicine = Medicine.query.order_by(Medicine.Medicine_Name.desc()).all()
    return render_template("medicine.html", medicine=medicine)


@app.route("/delete_patient/<id>")
def delete_patient(id):
    patient = Patient.query.filter_by(Patient_ID=id).first()
    if patient:
        msg_text = "Patient %s successfully removed" % str(patient)
        db.session.delete(patient)
        db.session.commit()
        flash(msg_text)
    return redirect(url_for("index"))


class MedicineForm(FlaskForm):
    name = StringField("Name", validators=[DataRequired()])
    price = StringField("Price", validators=[DataRequired()])
    amount = StringField("Amount", validators=[DataRequired()])
    submit = SubmitField("Submit")


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
    return render_template("add_medicine.html", form=form)
