Create Database Airlines;

Use Airlines;

Create table Flights(
id int,
Name VARCHAR(255),
Ticket_Price int,
Number_of_Passengers int,
Airport_Name VARCHAR(255)
);

Insert into Flights(id, Name, Ticket_Price, Number_of_Passengers, Airport_Name) Values (101,"Sudesh Fadke", 2000, 7, "Kolkkata Airport");

Insert into Flights(id, Name, Ticket_Price, Number_of_Passengers, Airport_Name) Values (102, "Ram Gopal", 3000, 6, "Pandrpur Airport");

Insert into Flights(id, Name, Ticket_Price, Number_of_Passengers, Airport_Name) Values (111, "Siddu Nevre", 4000, 5, "Delli Airport");

Insert into Flights(id, Name, Ticket_Price, Number_of_Passengers, Airport_Name) Values (112, "Sayli Falke", 7000, 8, "Panjab Airport");

Insert into Flights(id, Name, Ticket_Price, Number_of_Passengers, Airport_Name) Values (113, "Komal Bagve", 8000, 6, "Rajstan Airport");

select * From Flights;


 



