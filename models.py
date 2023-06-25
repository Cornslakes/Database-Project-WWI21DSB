from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from app import db
from sqlalchemy.orm import relationship


class Supplier(db.Model):
    __tablename__ = "Supplier"
    Supplier_ID = db.Column(db.UUID, primary_key=True)
    Supplier_Name = db.Column(db.String)
    Supplier_Mail = db.Column(db.String)
    Supplier_TelNr = db.Column(db.Integer)


class Medicine(db.Model):
    __tablename__ = "Medicine"
    Medicine_ID = db.Column(db.UUID, primary_key=True)
    Medicine_Name = db.Column(db.String)
    Medicine_Pricing = db.Column(db.String)
    Medicine_Amount = db.Column(db.Integer)


class Patient(db.Model):
    __tablename__ = "Patient"
    Patient_ID = db.Column(db.UUID, primary_key=True)
    Patient_Name = db.Column(db.Text)
    Patient_Forename = db.Column(db.Text)
    Patient_Sex = db.Column(db.Text)
    Patient_Birthdate = db.Column(db.Date)
    Address_ID = db.Column(db.UUID)


class Address(db.Model):
    __tablename__ = "Address"
    Address_ID = db.Column(db.UUID, primary_key=True)
    Address_Street = db.Column(db.Text)
    Address_HNr = db.Column(db.String)
    Place_Postal_Code = db.Column(db.Integer, db.ForeignKey("Place.Place_Postal_Code"))


class Place(db.Model):
    __tablename__ = "Place"
    Place_Postal_Code = db.Column(db.String, primary_key=True)
    Place_Name = db.Column(db.Integer)


class Employee(db.Model):
    __tablename__ = "Employee"
    Employee_ID = db.Column(db.UUID, primary_key=True)
    Employee_Name = db.Column(db.Text)
    Employee_Forename = db.Column(db.Text)
    Employee_Birthdate = db.Column(db.Date)
    Employee_Salary = db.Column(db.Integer)
    Employee_Role = db.Column(db.Text)
