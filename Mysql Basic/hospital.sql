CREATE DATABASE hospital;

USE hospital;

Create Table Patient(
Patient_id int,
Name VARCHAR(100),
Date_of_birth DATE,
address VARCHAR(200),
Contact_no int
);

INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(55, 'Vivek Bhekne', '1998-10-22', 'Ajra', '9960332142');
INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(65, 'Prashant Bamne', '2003-05-12', 'Gad', '8976553421');
INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(43, 'Vikas Patil', '2004-5-11', 'Phete', '9876665432');
INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(66, 'Ravindra Desai', '2005-1-7', 'Front', '9089776532');
INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(43, 'Akash Bamne', '2001-4-5', 'Kolhapur', '9765003421');
INSERT INTO Patient (Patient_id, Name, Date_of_birth, address, Contact_no) VALUES(33, 'Siddu Sutar','2006-3-1', 'Thane', '9087665421');

Select * From Patient;


UPDATE Patient SET address = 'ajra' WHERE address = 'mumbai';
Update Patient Set address = 'ajra' Where address = 'mumbai';

UPDATE Patient SET Date_of_birth = '2004-5-11' Where Date_of_birth = '1997-5-14';

DELETE FROM Patient Where Contact_no = '9089776532';

DELETE FROM Patient Where Patient_id = '43';

Select * From Patient;

Select * From Patient ORDER BY  Date_of_birth ASC LIMIT 5;

Select * From Patient ORDER BY Name asc;

select * From Patient ORDER BY ADDRESS DESC;