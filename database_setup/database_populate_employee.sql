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