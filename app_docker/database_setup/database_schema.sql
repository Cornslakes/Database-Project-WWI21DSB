-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Supplier"
(
    "Supplier_ID" uuid,
    "Supplier_Name" character varying,
    "Supplier_Mail" character varying,
    "Supplier_TelNr" character varying,
    PRIMARY KEY ("Supplier_ID")
);

CREATE TABLE IF NOT EXISTS public."Medicine"
(
    "Medicine_ID" uuid,
    "Medicine_Name" character varying,
    "Medicine_Pricing" money,
    "Medicine_Amount" smallint,
    PRIMARY KEY ("Medicine_ID")
);

CREATE TABLE IF NOT EXISTS public."Medicine_Supplier"
(
    "Medicine_Medicine_ID" uuid,
    "Supplier_Supplier_ID" uuid
);

CREATE TABLE IF NOT EXISTS public."Patient"
(
    "Patient_ID" uuid,
    "Patient_Name" text,
    "Patient_Forename" text,
    "Patient_Sex" character,
    "Patient_Age" smallint,
    "Patient_Birthdate" date,
    "Room_ID" uuid,
    "Address_ID" uuid,
    PRIMARY KEY ("Patient_ID")
);

CREATE TABLE IF NOT EXISTS public."Patient_Medicine"
(
    "Patient_Patient_ID" uuid,
    "Medicine_Medicine_ID" uuid,
    "Patient_Medicine_Amount" smallint
);

CREATE TABLE IF NOT EXISTS public."Address"
(
    "Address_ID" uuid,
    "Address_Street" text,
    "Address_HNr" character varying,
    "Place_Postal_Code" integer,
    PRIMARY KEY ("Address_ID")
);

CREATE TABLE IF NOT EXISTS public."Place"
(
    "Place_Name" text,
    "Place_Postal_Code" integer,
    PRIMARY KEY ("Place_Postal_Code")
);

CREATE TABLE IF NOT EXISTS public."Employee"
(
    "Employee_ID" uuid,
    "Employee_Name" text,
    "Employee_Forename" text,
    "Employee_Birthdate" date,
    "Employee_Salary" money,
    "Employee_Role" text,
    "Address_ID" uuid,
    PRIMARY KEY ("Employee_ID")
);

CREATE TABLE IF NOT EXISTS public."Station"
(
    "Station_ID" uuid,
    "Station_Name" text,
    "Station_Amount_of_rooms" smallint,
    PRIMARY KEY ("Station_ID")
);

CREATE TABLE IF NOT EXISTS public."Room"
(
    "Room_Nr" smallint,
    "Room_Size" smallint,
    "Room_isFull" boolean,
    "Station_ID" uuid,
    "Room_ID" uuid,
    PRIMARY KEY ("Room_ID")
);

CREATE TABLE IF NOT EXISTS public."Station_Employee"
(
    "Station_Station_ID" uuid,
    "Employee_Employee_ID" uuid
);

ALTER TABLE IF EXISTS public."Medicine_Supplier"
    ADD FOREIGN KEY ("Medicine_Medicine_ID")
    REFERENCES public."Medicine" ("Medicine_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Medicine_Supplier"
    ADD FOREIGN KEY ("Supplier_Supplier_ID")
    REFERENCES public."Supplier" ("Supplier_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient"
    ADD FOREIGN KEY ("Address_ID")
    REFERENCES public."Address" ("Address_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient"
    ADD FOREIGN KEY ("Room_ID")
    REFERENCES public."Room" ("Room_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_Medicine"
    ADD FOREIGN KEY ("Patient_Patient_ID")
    REFERENCES public."Patient" ("Patient_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_Medicine"
    ADD FOREIGN KEY ("Medicine_Medicine_ID")
    REFERENCES public."Medicine" ("Medicine_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Address"
    ADD FOREIGN KEY ("Place_Postal_Code")
    REFERENCES public."Place" ("Place_Postal_Code") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY ("Address_ID")
    REFERENCES public."Address" ("Address_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Room"
    ADD FOREIGN KEY ("Station_ID")
    REFERENCES public."Station" ("Station_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Station_Employee"
    ADD FOREIGN KEY ("Station_Station_ID")
    REFERENCES public."Station" ("Station_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public."Station_Employee"
    ADD FOREIGN KEY ("Employee_Employee_ID")
    REFERENCES public."Employee" ("Employee_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;

/*Function which is responsible for deleting weak entity set Room if parent entity Station is deleted.*/
CREATE FUNCTION fnc_DeleteRooms()
	RETURNS TRIGGER AS
	$$
	BEGIN
    	DELETE FROM "Room"
    	WHERE "Station_ID" = OLD."Station_ID";
    	RETURN OLD;
	END;
	$$
	LANGUAGE plpgsql;

/*Function which is responsible for populating Age attribute of Patient every time a new one is created.*/
CREATE FUNCTION calculate_age()
    RETURNS TRIGGER AS 
    $$
    BEGIN
        NEW."Patient_Age" := EXTRACT(YEAR FROM age(NEW."Patient_Birthdate"));
        RETURN NEW;
    END;
    $$ 
    LANGUAGE plpgsql;

/*Function which is responsible for updating Room_isFull attribute of Room every time one is edited or created.*/
CREATE OR REPLACE FUNCTION update_room_isfull()
    RETURNS TRIGGER AS 
    $$
    DECLARE
        room_count INTEGER;
    BEGIN
        SELECT COUNT(*) INTO room_count
        FROM "Room"
        WHERE "Station_ID" = NEW."Station_ID" AND "Room_isFull" = true;

        IF NEW."Room_Size" <= room_count THEN
            NEW."Room_isFull" := true;
        ELSE
            NEW."Room_isFull" := false;
        END IF;

        RETURN NEW;
    END;
    $$ 
    LANGUAGE plpgsql;

CREATE TRIGGER update_room_isfull_trigger
    BEFORE INSERT OR UPDATE ON "Room"
    FOR EACH ROW
    EXECUTE FUNCTION update_room_isfull();

CREATE TRIGGER trg_DeleteRooms
	BEFORE DELETE ON "Station"
	FOR EACH ROW
	EXECUTE FUNCTION fnc_DeleteRooms();

CREATE TRIGGER update_age_trigger
    BEFORE INSERT OR UPDATE ON "Patient"
    FOR EACH ROW
    EXECUTE FUNCTION calculate_age();

/*Simple views which are responsible for showing relevant Patient and Employee information.*/
CREATE VIEW patient_details AS
    SELECT 
        "Patient"."Patient_Name",
        "Patient"."Patient_Forename",
        "Patient"."Patient_Sex",
        "Patient"."Patient_Age",
        "Address"."Address_Street",
        "Address"."Address_HNr",
        "Address"."Place_Postal_Code",
        "Place"."Place_Name"
    FROM 
        "Patient"
    JOIN 
        "Address" ON "Patient"."Address_ID" = "Address"."Address_ID"
    JOIN 
        "Place" ON "Address"."Place_Postal_Code" = "Place"."Place_Postal_Code";

CREATE VIEW employee_details AS
    SELECT 
        "Employee"."Employee_Name",
        "Employee"."Employee_Forename",
        "Employee"."Employee_Role",
        "Address"."Address_Street",
        "Address"."Address_HNr",
        "Address"."Place_Postal_Code",
        "Place"."Place_Name"
    FROM 
        "Employee"
    JOIN 
        "Address" ON "Employee"."Address_ID" = "Address"."Address_ID"
    JOIN 
        "Place" ON "Address"."Place_Postal_Code" = "Place"."Place_Postal_Code";

/*Creates an index to improve performance of the business function queries.*/
CREATE INDEX idx_medicine_id ON public."Medicine" ("Medicine_ID");

END;