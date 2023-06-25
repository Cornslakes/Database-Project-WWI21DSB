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

INSERT INTO public."Address" ("Address_ID", "Address_Street", "Address_HNr", "Place_Postal_Code")
VALUES
    ('7e2e07b2-1f97-4f5a-a22f-01d85f6ed710', 'Example Street', '10a', '10115'),
    ('3a5b11a3-dc6f-488e-8ebe-65a485b8777f', 'Sample Avenue', '5b', '10785'),
    ('e81f6f71-0137-446a-a3e1-77f42e123c14', 'Test Road', '7', '12047'),
    ('b7e59a9c-0f5f-4d1b-9a21-9b22c6c5291a', 'Demo Lane', '2', '14059'),
    ('294d52f4-b212-4b8d-97c2-2e3fb15a36ae', 'Trial Boulevard', '12', '22083');

INSERT INTO public."Patient" ("Patient_ID", "Patient_Name", "Patient_Forename", "Patient_Sex", "Patient_Birthdate", "Address_ID")
VALUES 
  ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', 'Doe', 'John', 'M', '1990-01-01', '7e2e07b2-1f97-4f5a-a22f-01d85f6ed710'),
  ('b171d98e-9372-49cd-9f4b-d82dc00e0e61', 'Smith', 'Jane', 'F', '1985-03-15', '3a5b11a3-dc6f-488e-8ebe-65a485b8777f'),
  ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'Johnson', 'Michael', 'M', '1978-08-22', 'e81f6f71-0137-446a-a3e1-77f42e123c14'),
  ('f3a70776-574b-4399-93f2-52b036e78a2a', 'Williams', 'Emily', 'F', '1995-11-10', 'b7e59a9c-0f5f-4d1b-9a21-9b22c6c5291a'),
  ('83b54769-03f9-49d5-9ccf-1e1593ae2428', 'Anderson', 'Robert', 'M', '1982-06-05', '294d52f4-b212-4b8d-97c2-2e3fb15a36ae');


INSERT INTO public."Employee" ("Employee_ID", "Employee_Name", "Employee_Forename", "Employee_Birthdate", "Employee_Salary", "Employee_Role")
VALUES 
  ('bfe9ad49-eb64-4656-a5fa-0e0247810db1', 'Phillips', 'Amy', '1995-04-13', '$3327.57', 'Nurse'),
  ('2d3fe77f-f7bf-4578-bc92-749e14ff3379', 'Cross', 'Jeffery', '1991-09-07', '$3904.70', 'Nurse'),
  ('7a528f9d-ba97-4166-90b6-1c354915e2c2', 'Williams', 'Tiffany', '1990-11-05', '$9064.13', 'Doctor'),
  ('71536415-6b83-4594-b899-19303fb378d8', 'Blackwell', 'Tammy', '1973-04-07', '$7418.58', 'Doctor'),
  ('5f1b5f6e-ea49-406f-a5ec-3e0a67068685', 'Sullivan', 'Kimberly', '1998-02-18', '$9465.67', 'Doctor');

INSERT INTO public."Station" ("Station_ID", "Station_Name", "Station_Amount_of_rooms")
VALUES 
    ('43aebc23-7b9f-4f15-a652-4be9e13faa1f', 'Summerbreeze', 10),
    ('9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', 'Springvale', 5),
    ('eca57c86-2a61-4e68-84b2-8978c876aad4', 'Autumnwood', 8),
    ('d6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', 'Winterhaven', 6),
    ('3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'Harmony Hills', 7);

INSERT INTO public."Room" ("Room_Nr", "Room_Size", "Room_isFull", "Station_ID", "Room_ID")
VALUES 
    (1, 10, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f',  '0818ed14-5a2a-4e72-ae68-7ccf8932ef5d'),
    (2, 8, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f', 'e6429ef2-137b-4dd9-bff3-34b2f9eac074'),
    (1, 5, false, '9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', '8d3a5273-62f4-4dcf-b7f2-7b417c9ce3e2'),
    (2, 7, false, '9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', '879a9650-180a-4d0b-9bc1-1d4809d8a9e7'),
    (1, 8, false, 'eca57c86-2a61-4e68-84b2-8978c876aad4', '4e97dd25-df64-4321-9b99-1d6c232b2bda'),
    (2, 6, false, 'eca57c86-2a61-4e68-84b2-8978c876aad4', '2e8965d7-3a5d-4bc2-9833-4a4a0da0ef18'),
    (1, 7, false, 'd6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', '2b79f559-ff81-4e16-9b89-499a61a98ef6'),
    (2, 5, false, 'd6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', '48b5e0c2-92c3-4a43-8c6f-6c6a7b11a20c'),
    (1, 6, false, '3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'c0c9875d-9a9a-4df3-ba3f-4d21e43e45fc'),
    (2, 9, false, '3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'f33d3542-b5ff-4d0d-8485-b76e54bcf12b');
