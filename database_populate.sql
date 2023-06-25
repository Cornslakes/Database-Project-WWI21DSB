INSERT INTO public."Medicine" ("Medicine_ID", "Medicine_Name", "Medicine_Pricing", "Medicine_Amount")
VALUES
    ('1e6729b7-6a50-4f92-9b8e-285bfde2e3ca', 'Aspirin', '$50.00', 10),
    ('4a6c887e-9876-4e4c-9e9b-d6e285ce9325', 'Ibuprofen', '$70.00', 10),
    ('b23f3e2c-5a2d-4d4b-9e7e-fcfcba45d788', 'Acetaminophen', '$60.00', 10),
    ('5e9d9e36-9386-4a7f-af50-c83c48a9837a', 'Lipitor', '$120.00', 10),
    ('a108234a-94a2-4d60-93e2-15f91f7e22f3', 'Zyrtec', '$90.00', 10),
    ('ef2a4cd8-9bb7-44b3-8c4d-7a5977e4817c', 'Nexium', '$150.00', 10),
    ('d92a7b5a-746c-4148-a7a3-6b6b3723ae85', 'Ventolin', '$80.00', 10),
    ('f8a28635-9c0e-4717-bdf3-8a5b8ebd4d72', 'Advil', '$60.00', 10),
    ('b8e08ff6-d88c-4e82-9e53-2ee8eaa79547', 'Prozac', '$100.00', 10),
    ('f598e688-9b7b-4fb3-af3a-7220c0a66989', 'Crestor', '$130.00', 10);

INSERT INTO public."Patient" ("Patient_ID", "Patient_Name", "Patient_Forename", "Patient_Sex", "Patient_Birthdate")
VALUES 
  ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', 'Doe', 'John', 'M', '1990-01-01'),
  ('b171d98e-9372-49cd-9f4b-d82dc00e0e61', 'Smith', 'Jane', 'F', '1985-03-15'),
  ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'Johnson', 'Michael', 'M', '1978-08-22'),
  ('f3a70776-574b-4399-93f2-52b036e78a2a', 'Williams', 'Emily', 'F', '1995-11-10'),
  ('83b54769-03f9-49d5-9ccf-1e1593ae2428', 'Anderson', 'Robert', 'M', '1982-06-05');



INSERT INTO public."Employee" ("Employee_ID", "Employee_Name", "Employee_Forename", "Employee_Birthdate", "Employee_Salary", "Employee_Role")
VALUES 
  ('bfe9ad49-eb64-4656-a5fa-0e0247810db1', 'Phillips', 'Amy', '1995-04-13', '$3327.57', 'Nurse'),
  ('2d3fe77f-f7bf-4578-bc92-749e14ff3379', 'Cross', 'Jeffery', '1991-09-07', '$3904.70', 'Nurse'),
  ('7a528f9d-ba97-4166-90b6-1c354915e2c2', 'Williams', 'Tiffany', '1990-11-05', '$9064.13', 'Doctor'),
  ('71536415-6b83-4594-b899-19303fb378d8', 'Blackwell', 'Tammy', '1973-04-07', '$7418.58', 'Doctor'),
  ('5f1b5f6e-ea49-406f-a5ec-3e0a67068685', 'Sullivan', 'Kimberly', '1998-02-18', '$9465.67', 'Doctor');
