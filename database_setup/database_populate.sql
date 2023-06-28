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



INSERT INTO public."Patient" ("Patient_ID", "Patient_Name", "Patient_Forename", "Patient_Sex", "Patient_Birthdate", "Address_ID")
VALUES 
  ('c7a5f5e0-9a84-4f48-90b7-6f6fe29e135a', 'Doe', 'John', 'M', '1990-01-01', '7e2e07b2-1f97-4f5a-a22f-01d85f6ed710'),
  ('b171d98e-9372-49cd-9f4b-d82dc00e0e61', 'Smith', 'Jane', 'F', '1985-03-15', '3a5b11a3-dc6f-488e-8ebe-65a485b8777f'),
  ('d57b2a6d-7da9-44c6-a2c1-59811b77b1d3', 'Johnson', 'Michael', 'M', '1978-08-22', 'e81f6f71-0137-446a-a3e1-77f42e123c14'),
  ('f3a70776-574b-4399-93f2-52b036e78a2a', 'Williams', 'Emily', 'F', '1995-11-10', 'b7e59a9c-0f5f-4d1b-9a21-9b22c6c5291a'),
  ('83b54769-03f9-49d5-9ccf-1e1593ae2428', 'Anderson', 'Robert', 'M', '1982-06-05', '294d52f4-b212-4b8d-97c2-2e3fb15a36ae');
