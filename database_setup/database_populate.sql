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

INSERT INTO public."Supplier" ("Supplier_ID", "Supplier_Name", "Supplier_Mail", "Supplier_TelNr")
VALUES
    ('4bbaa531-48d6-4b1d-a648-8f126ff83196', 'MediHealth Supplies', 'info@medihealth.com', '555-123-4567'),
    ('9bc4a1ae-76ef-4b32-9db6-74c3df080695', 'PharmaSolutions', 'contact@pharmasolutions.com', '555-987-6543'),
    ('e422b41b-61f5-4e5b-9b87-dc53d23c1e48', 'PharmaPlus Distributors', 'sales@pharmaplus.com', '555-246-8135'),
    ('61c9a891-7989-44c7-8f78-0dc4ae2e47a4', 'HealthCare Wholesale', 'wholesale@healthcare.com', '555-369-1478'),
    ('d92e9c0b-1a85-4c1b-8bfc-2e8e8e30b7b7', 'PharmaSupply Direct', 'orders@pharmasupplydirect.com', '555-654-9872'),
    ('a234ba01-58e9-4f45-90a7-75eaf977e6ab', 'MediPharm Distributors', 'info@medipharmdist.com', '555-789-1234'),
    ('7ef6a1e9-4e66-4be1-b79a-2c4d5ff7af45', 'HealthPro Pharma', 'info@healthpropharma.com', '555-123-7890'),
    ('e7d4777f-791d-42c2-8dc0-82c5e309b556', 'PharmaLink Suppliers', 'sales@pharmalinksuppliers.com', '555-456-7890'),
    ('2cdd97c2-3aa5-4ab0-af5a-5115ef7e3e61', 'GlobalRx Solutions', 'orders@globalrxsolutions.com', '555-987-3210'),
    ('5f118a0f-d35b-40ea-8f2d-cbf34ed5ac53', 'MediCorp Pharmaceuticals', 'contact@medicorppharma.com', '555-321-6540');

INSERT INTO public."Medicine_Supplier" ("Medicine_Medicine_ID", "Supplier_Supplier_ID")
VALUES
    ('1e6729b7-6a50-4f92-9b8e-285bfde2e3ca','4bbaa531-48d6-4b1d-a648-8f126ff83196'),
    ('4a6c887e-9876-4e4c-9e9b-d6e285ce9325','9bc4a1ae-76ef-4b32-9db6-74c3df080695'),
    ('b23f3e2c-5a2d-4d4b-9e7e-fcfcba45d788','e422b41b-61f5-4e5b-9b87-dc53d23c1e48'),
    ('5e9d9e36-9386-4a7f-af50-c83c48a9837a','61c9a891-7989-44c7-8f78-0dc4ae2e47a4'),
    ('a108234a-94a2-4d60-93e2-15f91f7e22f3','d92e9c0b-1a85-4c1b-8bfc-2e8e8e30b7b7'),
    ('ef2a4cd8-9bb7-44b3-8c4d-7a5977e4817c','a234ba01-58e9-4f45-90a7-75eaf977e6ab'),
    ('d92a7b5a-746c-4148-a7a3-6b6b3723ae85','7ef6a1e9-4e66-4be1-b79a-2c4d5ff7af45'),
    ('f8a28635-9c0e-4717-bdf3-8a5b8ebd4d72','e7d4777f-791d-42c2-8dc0-82c5e309b556'),
    ('b8e08ff6-d88c-4e82-9e53-2ee8eaa79547','2cdd97c2-3aa5-4ab0-af5a-5115ef7e3e61'),
    ('f598e688-9b7b-4fb3-af3a-7220c0a66989','5f118a0f-d35b-40ea-8f2d-cbf34ed5ac53');

INSERT INTO public."Address" ("Address_ID", "Address_Street", "Address_HNr", "Place_Postal_Code")
VALUES
    ('7e2e07b2-1f97-4f5a-a22f-01d85f6ed710', 'Example Street', '10a', '10115'),
    ('3a5b11a3-dc6f-488e-8ebe-65a485b8777f', 'Sample Avenue', '5b', '10785'),
    ('e81f6f71-0137-446a-a3e1-77f42e123c14', 'Test Road', '7', '12047'),
    ('b7e59a9c-0f5f-4d1b-9a21-9b22c6c5291a', 'Demo Lane', '2', '14059'),
    ('294d52f4-b212-4b8d-97c2-2e3fb15a36ae', 'Trial Boulevard', '12', '22083'),
    ('a6e4b9f4-3a62-4eb4-9c16-51227ae137a1', 'Musterstraße', '1', '68161'),
    ('37f7a3f7-1284-4a4b-9d47-0b8846e0a503', 'Beispielweg', '2', '68163'),
    ('e48649f6-6109-47f5-a8e0-34469e957a51', 'Testgasse', '3', '68165'),
    ('aae42bde-8d70-481a-9764-8e7e5f63a2e2', 'Hauptplatz', '4', '68167'),
    ('d49bca7d-7e6c-4b3d-84f1-973b4f0a243c', 'Musterweg', '5', '68169'),
    ('8f593146-4b17-4e7f-8901-6f5d7dc7d0d4', 'Beispielpfad', '6', '68199'),
    ('deee2064-1a23-4f20-8dd5-28c86c715992', 'Testallee', '7', '68219'),
    ('fbdf7b39-7e5b-4b94-864c-2f6bdfae309f', 'Am Markt', '8', '68219'),
    ('8a5c7e6f-2a6a-4e7f-b234-8f170f5b6e24', 'Musterplatz', '9', '68161'),
    ('a64bb754-4dbd-47f0-82b5-6e4b8eb12f47', 'Beispielstraße', '10', '68163');

INSERT INTO public."Station" ("Station_ID", "Station_Name", "Station_Amount_of_rooms")
VALUES 
    ('43aebc23-7b9f-4f15-a652-4be9e13faa1f', 'Summerbreeze', 10),
    ('9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', 'Springvale', 10),
    ('eca57c86-2a61-4e68-84b2-8978c876aad4', 'Autumnwood', 8),
    ('d6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', 'Winterhaven', 6),
    ('3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'Harmony Hills', 7);

INSERT INTO public."Room" ("Room_Nr", "Room_Size", "Room_isFull", "Station_ID", "Room_ID")
VALUES 
    (1, 2, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f',  '0818ed14-5a2a-4e72-ae68-7ccf8932ef5d'),
    (2, 1, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f', 'e6429ef2-137b-4dd9-bff3-34b2f9eac074'),
    (3, 4, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f',  '7c71afda-0661-43bb-923c-0a8066fc8c31'),
    (4, 1, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f',  'ee03a8eb-067b-4b8d-8e10-e146eb28becb'),
    (5, 2, false, '43aebc23-7b9f-4f15-a652-4be9e13faa1f',  'e5403ce1-2509-4e79-a31f-99e1032747aa'),
    (6, 3, false, '9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', '8d3a5273-62f4-4dcf-b7f2-7b417c9ce3e2'),
    (7, 1, false, '9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5', '879a9650-180a-4d0b-9bc1-1d4809d8a9e7'),
    (8, 3, false, 'eca57c86-2a61-4e68-84b2-8978c876aad4', '4e97dd25-df64-4321-9b99-1d6c232b2bda'),
    (9, 4, false, 'eca57c86-2a61-4e68-84b2-8978c876aad4', '2e8965d7-3a5d-4bc2-9833-4a4a0da0ef18'),
    (10, 3, false, 'd6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', '2b79f559-ff81-4e16-9b89-499a61a98ef6'),
    (11, 2, false, 'd6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01', '48b5e0c2-92c3-4a43-8c6f-6c6a7b11a20c'),
    (12, 2, false, '3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'c0c9875d-9a9a-4df3-ba3f-4d21e43e45fc'),
    (13, 4, false, '3f09de30-525f-4ad3-9b8a-fb7f8df515c8', 'f33d3542-b5ff-4d0d-8485-b76e54bcf12b');


INSERT INTO public."Patient" ("Patient_ID", "Patient_Name", "Patient_Forename", "Patient_Sex", "Patient_Birthdate", "Address_ID", "Room_ID")
VALUES 
  ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', 'Doe', 'John', 'M', '1990-01-01', '7e2e07b2-1f97-4f5a-a22f-01d85f6ed710','0818ed14-5a2a-4e72-ae68-7ccf8932ef5d'),
  ('b171d98e-9372-49cd-9f4b-d82dc00e0e61', 'Smith', 'Jane', 'F', '1985-03-15', '3a5b11a3-dc6f-488e-8ebe-65a485b8777f','e6429ef2-137b-4dd9-bff3-34b2f9eac074'),
  ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'Johnson', 'Michael', 'M', '1978-08-22', 'e81f6f71-0137-446a-a3e1-77f42e123c14','e5403ce1-2509-4e79-a31f-99e1032747aa'),
  ('f3a70776-574b-4399-93f2-52b036e78a2a', 'Williams', 'Emily', 'F', '1995-11-10', 'b7e59a9c-0f5f-4d1b-9a21-9b22c6c5291a','2b79f559-ff81-4e16-9b89-499a61a98ef6'),
  ('83b54769-03f9-49d5-9ccf-1e1593ae2428', 'Anderson', 'Robert', 'M', '1982-06-05', '294d52f4-b212-4b8d-97c2-2e3fb15a36ae','f33d3542-b5ff-4d0d-8485-b76e54bcf12b');

INSERT INTO public."Patient_Medicine" ("Patient_Patient_ID", "Medicine_Medicine_ID", "Patient_Medicine_Amount")
VALUES
    ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', '1e6729b7-6a50-4f92-9b8e-285bfde2e3ca', 3),
    ('b171d98e-9372-49cd-9f4b-d82dc00e0e61', 'f598e688-9b7b-4fb3-af3a-7220c0a66989', 2),
    ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'ef2a4cd8-9bb7-44b3-8c4d-7a5977e4817c', 5),
    ('f3a70776-574b-4399-93f2-52b036e78a2a', 'a108234a-94a2-4d60-93e2-15f91f7e22f3', 1),
    ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', 'b8e08ff6-d88c-4e82-9e53-2ee8eaa79547', 5),
    ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'b8e08ff6-d88c-4e82-9e53-2ee8eaa79547', 1),
    ('f3a70776-574b-4399-93f2-52b036e78a2a', 'b8e08ff6-d88c-4e82-9e53-2ee8eaa79547', 5),
    ('83b54769-03f9-49d5-9ccf-1e1593ae2428', 'a108234a-94a2-4d60-93e2-15f91f7e22f3', 4);

INSERT INTO public."Employee" ("Employee_ID", "Employee_Name", "Employee_Forename", "Employee_Birthdate", "Employee_Salary", "Employee_Role", "Address_ID")
VALUES 
  ('2d3fe77f-f7bf-4578-bc92-749e14ff3379', 'Cross', 'Jeffery', '1991-09-07', '$3904.70', 'Nurse', '37f7a3f7-1284-4a4b-9d47-0b8846e0a503'),
  ('7a528f9d-ba97-4166-90b6-1c354915e2c2', 'Williams', 'Tiffany', '1990-11-05', '$9064.13', 'Doctor', 'e48649f6-6109-47f5-a8e0-34469e957a51'),
  ('71536415-6b83-4594-b899-19303fb378d8', 'Blackwell', 'Tammy', '1973-04-07', '$7418.58', 'Doctor', 'aae42bde-8d70-481a-9764-8e7e5f63a2e2'),
  ('5f1b5f6e-ea49-406f-a5ec-3e0a67068685', 'Sullivan', 'Kimberly', '1998-02-18', '$9465.67', 'Doctor', 'd49bca7d-7e6c-4b3d-84f1-973b4f0a243c'),
  ('73fdf819-60e5-4d9e-838d-b2d11a009f0c', 'Dunn', 'Danielle', '1960-10-10', '$3095.06', 'Nurse', '8f593146-4b17-4e7f-8901-6f5d7dc7d0d4'),
  ('e2749763-a41c-43a8-b3ed-3a1c9f6e2d44', 'Gutierrez', 'Drew', '1996-07-06', '$4777.86', 'Nurse', 'deee2064-1a23-4f20-8dd5-28c86c715992'),
  ('9e6a61a1-2a86-44e2-a57c-dd5329dbfe0b', 'Clark', 'Jeffrey', '1983-03-19', '$3313.46', 'Nurse', 'fbdf7b39-7e5b-4b94-864c-2f6bdfae309f'),
  ('380164a7-52fd-40b4-9338-d86d21377e81', 'Anderson', 'Mark', '1953-02-08', '$3581.54', 'Nurse', '8a5c7e6f-2a6a-4e7f-b234-8f170f5b6e24'),
  ('18225c7a-e72d-4937-95a6-3af315d3cb15', 'Yates', 'Brenda', '1954-10-28', '$4037.31', 'Nurse', 'a64bb754-4dbd-47f0-82b5-6e4b8eb12f47');

INSERT INTO public."Station_Employee" ("Station_Station_ID", "Employee_Employee_ID")
VALUES
('43aebc23-7b9f-4f15-a652-4be9e13faa1f','2d3fe77f-f7bf-4578-bc92-749e14ff3379'),
('eca57c86-2a61-4e68-84b2-8978c876aad4','7a528f9d-ba97-4166-90b6-1c354915e2c2'),
('9f9ad0c7-09d8-45fb-b293-1e4b1c8c59d5','71536415-6b83-4594-b899-19303fb378d8'),
('43aebc23-7b9f-4f15-a652-4be9e13faa1f','5f1b5f6e-ea49-406f-a5ec-3e0a67068685'),
('3f09de30-525f-4ad3-9b8a-fb7f8df515c8','73fdf819-60e5-4d9e-838d-b2d11a009f0c'),
('eca57c86-2a61-4e68-84b2-8978c876aad4','e2749763-a41c-43a8-b3ed-3a1c9f6e2d44'),
('d6e9c3fa-bd9e-4f7d-aac5-968a2c8e0f01','380164a7-52fd-40b4-9338-d86d21377e81'),
('43aebc23-7b9f-4f15-a652-4be9e13faa1f','18225c7a-e72d-4937-95a6-3af315d3cb15');