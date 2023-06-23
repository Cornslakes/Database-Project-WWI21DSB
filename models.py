from flask_sqlalchemy import SQLAlchemy 
from flask import Flask
from app import db


class Medicine(db.Model):
     __tablename__ = 'Medicine'
     Medicine_ID = db.Column(db.String(100), primary_key = True)
     Medicine_Name = db.Column(db.String)
     Medicine_Pricing = db.Column(db.String(100))
     Medicine_Amount= db.Column(db.Integer)

     def __init__(self, name):
        self.Medicine_Name = name

                     
