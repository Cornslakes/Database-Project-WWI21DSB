from flask import Flask, url_for, render_template, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
from flask_bootstrap import Bootstrap
import os

app = Flask (__name__)
bootstrap = Bootstrap(app)

app.config[
    "SQLALCHEMY_DATABASE_URI"
] = "postgresql://admin:123@localhost:5433/hospital"

db = SQLAlchemy(app)
from models import Medicine

@app.route('/')
def index():
    title="List of medicine stock:"
    medicine = Medicine.query.order_by(Medicine.Medicine_Name.desc()).all()
    return render_template('medicine.html', medicine=medicine)