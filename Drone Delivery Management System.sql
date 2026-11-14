DROP TABLE IF EXISTS Deliveries CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Pilots CASCADE;
DROP TABLE IF EXISTS Drones CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP VIEW IF EXISTS DeliveredOrders CASCADE;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(200) NOT NULL
);


CREATE TABLE Drones (
    drone_id INT PRIMARY KEY,
    drone_name VARCHAR(50) NOT NULL,
    model VARCHAR(50),
    max_weight DECIMAL(5,2),
    status VARCHAR(20) CHECK(status IN ('Available','Busy','Maintenance'))
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    drone_id INT,
    order_date DATE,
    destination VARCHAR(200),
    package_weight DECIMAL(5,2),
    delivery_status VARCHAR(20)
        CHECK(delivery_status IN ('Pending','In Transit','Delivered','Cancelled')),
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY(drone_id) REFERENCES Drones(drone_id)
);


CREATE TABLE Pilots (
    pilot_id INT PRIMARY KEY,
    pilot_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    license_no VARCHAR(50) UNIQUE
);


CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    pilot_id INT,
    delivery_time TIME,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(pilot_id) REFERENCES Pilots(pilot_id)
);

INSERT INTO Customers VALUES
(1,'Rahul Sharma','9876500001','rahul@gmail.com','Chennai'),
(2,'Priya Nair','9876500002','priya@gmail.com','Coimbatore'),
(3,'Arun Kumar','9876500003','arun@gmail.com','Madurai'),
(4,'Sneha Patel','9876500004','sneha@gmail.com','Trichy'),
(5,'Vijay Kumar','9876500005','vijay@gmail.com','Salem'),
(6,'Anitha Devi','9876500006','anitha@gmail.com','Erode'),
(7,'Rohit Verma','9876500007','rohit@gmail.com','Vellore'),
(8,'Deepika Singh','9876500008','deepika@gmail.com','Tirunelveli'),
(9,'Karthik Raj','9876500009','karthik@gmail.com','Thoothukudi'),
(10,'Meena Ravi','9876500010','meena@gmail.com','Thanjavur'),
(11,'Ajay Kumar','9876500011','ajay@gmail.com','Kanchipuram'),
(12,'Harini S','9876500012','harini@gmail.com','Tambaram'),
(13,'Suresh Babu','9876500013','suresh@gmail.com','Pallavaram'),
(14,'Divya R','9876500014','divya@gmail.com','Adyar'),
(15,'Naveen Raj','9876500015','naveen@gmail.com','Anna Nagar'),
(16,'Keerthana M','9876500016','keerthana@gmail.com','Velachery'),
(17,'Manoj Kumar','9876500017','manoj@gmail.com','Chromepet'),
(18,'Lavanya P','9876500018','lavanya@gmail.com','Porur'),
(19,'Akash S','9876500019','akash@gmail.com','Guindy'),
(20,'Nithya K','9876500020','nithya@gmail.com','T Nagar');


INSERT INTO Drones VALUES
(101,'SkyFly X1','DJI Mini 4',5.00,'Available'),
(102,'AirSwift A2','DJI Air 3',6.50,'Busy'),
(103,'Eagle Eye','DJI Mavic 3',8.00,'Maintenance'),
(104,'Falcon Pro','DJI Inspire 2',10.00,'Available'),
(105,'HoverMax','Parrot Anafi',4.50,'Busy'),
(106,'SpeedWing','Autel EVO Lite',7.00,'Available'),
(107,'Cloud Rider','DJI Phantom 4',5.50,'Available'),
(108,'RapidFly','Skydio X2',6.00,'Busy'),
(109,'AeroLift','DJI Matrice 30',12.00,'Maintenance'),
(110,'SkyRunner','DJI Air 2S',5.20,'Available'),
(111,'DroneX','Autel EVO II',9.00,'Busy'),
(112,'FlyBot','Parrot Bebop 2',4.80,'Available'),
(113,'ThunderFly','DJI Mini 3',3.50,'Available'),
(114,'Swift Hawk','DJI FPV',5.80,'Busy'),
(115,'Vision Air','Skydio 2+',6.30,'Maintenance'),
(116,'Blue Falcon','Autel Nano+',4.20,'Available'),
(117,'Storm Rider','DJI Matrice 300',15.00,'Busy'),
(118,'Sky Zoom','Parrot Disco',5.60,'Available'),
(119,'Aero Swift','DJI Mavic Air',4.90,'Available'),
(120,'Falcon X','DJI Inspire 3',11.50,'Busy');


INSERT INTO Pilots VALUES
(1,'Arun Kumar','9876500001','LIC001'),
(2,'Rahul Sharma','9876500002','LIC002'),
(3,'Priya Nair','9876500003','LIC003'),
(4,'Karthik Raj','9876500004','LIC004'),
(5,'Anitha Devi','9876500005','LIC005'),
(6,'Vijay Kumar','9876500006','LIC006'),
(7,'Deepak Singh','9876500007','LIC007'),
(8,'Sneha Patel','9876500008','LIC008'),
(9,'Rohit Verma','9876500009','LIC009'),
(10,'Meena Ravi','9876500010','LIC010'),
(11,'Ajay Kumar','9876500011','LIC011'),
(12,'Harini S','9876500012','LIC012'),
(13,'Suresh Babu','9876500013','LIC013'),
(14,'Divya R','9876500014','LIC014'),
(15,'Naveen Raj','9876500015','LIC015'),
(16,'Keerthana M','9876500016','LIC016'),
(17,'Manoj Kumar','9876500017','LIC017'),
(18,'Lavanya P','9876500018','LIC018'),
(19,'Akash S','9876500019','LIC019'),
(20,'Nithya K','9876500020','LIC020');



INSERT INTO Orders VALUES
(1001,1,101,'2026-06-01','Tambaram',2.5,'Delivered'),
(1002,2,102,'2026-06-02','Velachery',3.2,'Pending'),
(1003,3,103,'2026-06-03','T Nagar',1.8,'Delivered'),
(1004,4,104,'2026-06-04','Adyar',4.5,'In Transit'),
(1005,5,105,'2026-06-05','Anna Nagar',2.1,'Delivered'),
(1006,6,106,'2026-06-06','Guindy',3.8,'Cancelled'),
(1007,7,107,'2026-06-07','Porur',1.9,'Delivered'),
(1008,8,108,'2026-06-08','Perungudi',2.7,'Pending'),
(1009,9,109,'2026-06-09','Chromepet',4.0,'Delivered'),
(1010,10,110,'2026-06-10','Ambattur',3.5,'In Transit'),
(1011,11,111,'2026-06-11','Mylapore',2.3,'Delivered'),
(1012,12,112,'2026-06-12','Vadapalani',1.7,'Pending'),
(1013,13,113,'2026-06-13','Pallavaram',2.9,'Delivered'),
(1014,14,114,'2026-06-14','Medavakkam',4.6,'Delivered'),
(1015,15,115,'2026-06-15','Egmore',3.0,'Cancelled'),
(1016,16,116,'2026-06-16','Kodambakkam',2.8,'Delivered'),
(1017,17,117,'2026-06-17','Sholinganallur',4.2,'In Transit'),
(1018,18,118,'2026-06-18','Nungambakkam',1.5,'Delivered'),
(1019,19,119,'2026-06-19','Tambaram East',2.6,'Pending'),
(1020,20,120,'2026-06-20','Thoraipakkam',3.4,'Delivered');


INSERT INTO Deliveries VALUES
(1,1001,1,'09:15:00',5),
(2,1002,2,'10:00:00',4),
(3,1003,3,'10:45:00',5),
(4,1004,4,'11:30:00',3),
(5,1005,5,'12:15:00',5),
(6,1006,6,'13:00:00',2),
(7,1007,7,'13:45:00',4),
(8,1008,8,'14:30:00',5),
(9,1009,9,'15:15:00',4),
(10,1010,10,'16:00:00',3),
(11,1011,11,'09:30:00',5),
(12,1012,12,'10:20:00',4),
(13,1013,13,'11:10:00',5),
(14,1014,14,'12:00:00',5),
(15,1015,15,'12:50:00',2),
(16,1016,16,'13:40:00',4),
(17,1017,17,'14:30:00',3),
(18,1018,18,'15:20:00',5),
(19,1019,19,'16:10:00',4),
(20,1020,20,'17:00:00',5);


ALTER TABLE Drones
ADD battery_level INT;



TRUNCATE TABLE Pilots;

UPDATE Orders
SET delivery_status='Delivered'
WHERE order_id=1001;


DELETE FROM Orders
WHERE order_id=1002;


SELECT * FROM Orders;

SELECT *
FROM Drones
WHERE status='Available';


SELECT *
FROM Deliveries
ORDER BY rating DESC;


SELECT delivery_status,
COUNT(*) AS TotalOrders
FROM Orders
GROUP BY delivery_status;



SELECT drone_id,
COUNT(*) AS TotalDeliveries
FROM Orders
GROUP BY drone_id
HAVING COUNT(*) > 1;

SELECT DISTINCT destination
FROM Orders;

SELECT *
FROM Customers
WHERE customer_name LIKE 'P%';

SELECT *
FROM Orders
LIMIT 5;


SELECT
O.order_id,
C.customer_name,
D.drone_name
FROM Orders O
INNER JOIN Customers C
ON O.customer_id=C.customer_id
INNER JOIN Drones D
ON O.drone_id=D.drone_id;

SELECT
C.customer_name,
O.order_id
FROM Customers C
LEFT JOIN Orders O
ON C.customer_id=O.customer_id;


SELECT
C.customer_name,
O.order_id
FROM Customers C
RIGHT JOIN Orders O
ON C.customer_id=O.customer_id;

SELECT
C.customer_name,
O.order_id
FROM Customers C
FULL JOIN Orders O
ON C.customer_id=O.customer_id;


SELECT customer_name AS Name
FROM Customers

UNION

SELECT pilot_name
FROM Pilots;


CREATE VIEW DeliveredOrders AS
SELECT
order_id,
destination,
delivery_status
FROM Orders
WHERE delivery_status='Delivered';

SELECT * FROM DeliveredOrders;


CREATE INDEX idx_destination
ON Orders(destination);


CREATE SEQUENCE order_seq
START WITH 1000
INCREMENT BY 1;

DELIMITER $$

CREATE TRIGGER trg_order_insert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Drones
    SET status='Busy'
    WHERE drone_id=NEW.drone_id;
END $$

DELIMITER ;