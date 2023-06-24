from flask import Flask, url_for, render_template, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
from flask_bootstrap import Bootstrap
import os

app = Flask (__name__)
app.secret_key = "super secret key"
app.app_context().push()
bootstrap = Bootstrap(app)

app.config[
    "SQLALCHEMY_DATABASE_URI"
] = "postgresql://admin:123@localhost:5433/hospital"

db = SQLAlchemy(app)
from models import Medicine, Patient

@app.route('/', methods=['GET', 'POST'])
def index():
    title="List of patients:"
    patient = Patient.query.order_by(Patient.Patient_Name.desc()).all()
    return render_template('patient.html', patient=patient)

@app.route('/medicine')
def medicine_stock():
    title="List of current medicine stock:"
    medicine = Medicine.query.order_by(Medicine.Medicine_Name.desc()).all()
    return render_template('medicine.html', medicine=medicine)

@app.route('/delete_patient/<id>')
def delete_patient(id):
    patient = Patient.query.filter_by(Patient_ID=id).first()
    if patient:
        msg_text = 'Patient %s successfully removed' % str(patient)
        db.session.delete(patient)
        db.session.commit()
        flash(msg_text)
    return redirect(url_for('index'))
