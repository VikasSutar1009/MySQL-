CREATE DATABASE hospital_mgnt_example;

USE hospital_mgnt_example;

-- Hospital Management Example (Stored Procedure)
-- Goal
-- Create a procedure for Patient Registration

CREATE TABLE patients(
	patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    disease VARCHAR(100),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE PROCEDURE AddPatient(
	IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_disease VARCHAR(100),
    IN p_city VARCHAR(50)
)
BEGIN

IF p_age > 0 THEN
	INSERT INTO patients(patient_name, age, disease, city)
    VALUES(p_name, p_age, p_disease, p_city);
ELSE
	SELECT 'Invalid Age' AS Message;
END IF;
END $$
DELIMITER ;

CALL AddPatient('Vikas', 22, 'Feaver','Kolhapur');
CALL AddPatient('Sushant', 20, 'Cold', 'Pune');
CALL AddPatient('Sahil', 23, 'Body pain', 'Sangali');


SELECT * FROM patients;

-- Stored Procedure with UPDATE
-- Update patient disease.

DELIMITER $$

CREATE PROCEDURE UpdateDisease(
	IN p_id INT,
    IN New_disease VARCHAR(100)
)
BEGIN
	UPDATE patient
    SET disease = new_disease
    WHERE patient_id = p_id;
END $$

DELIMITER $$

-- Store Procedure with DELETE
DELIMITER $$

CREATE PROCEDURE DeletePatient(
	IN p_id INT
) 
BEGIN
	DELETE FROM patients
    WHERE patient_id = p_id;
END $$

DELIMITER $$
