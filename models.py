from flask_sqlalchemy import SQLAlchemy 
from flask import Flask
from app import db


class Supplier(db.Model):
     __tablename__ = 'Supplier'
     Supplier_ID = db.Column(db.UUID, primary_key = True)
     Supplier_Name = db.Column(db.String)
     Supplier_Mail = db.Column(db.String)
     Supplier_TelNr= db.Column(db.Integer)

class Medicine(db.Model):
     __tablename__ = 'Medicine'
     Medicine_ID = db.Column(db.UUID, primary_key = True)
     Medicine_Name = db.Column(db.String)
     Medicine_Pricing = db.Column(db.String)
     Medicine_Amount= db.Column(db.Integer)
     
class Patient(db.Model):
     __tablename__ = 'Patient'
     Patient_ID = db.Column(db.UUID, primary_key = True)
     Patient_Name = db.Column(db.Text)
     Patient_Forename = db.Column(db.Text)
     Patient_Sex = db.Column(db.Text)
     Patient_Birthdate = db.Column(db.Date)
