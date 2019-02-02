DROP DATABASE IF EXISTS boosterjuice;

CREATE DATABASE boosterjuice;

use boosterjuice;

CREATE TABLE Store
(StoreID 				INTEGER AUTO_INCREMENT,
Password 				CHAR(15),
Phone 					CHAR(12),
Location 				CHAR(200),
PRIMARY KEY	(StoreID),
UNIQUE 			(Phone));

CREATE TABLE Customer
(CustId 				INTEGER AUTO_INCREMENT,
Password 				CHAR(15),
Name 						CHAR(50),
Phone 					CHAR(12),
Email 					CHAR(60),
LP 							CHAR(10),
PRIMARY KEY	(CustId),
UNIQUE (Phone),
UNIQUE (Email));

CREATE TABLE MenuItem
(ItemID 				INTEGER AUTO_INCREMENT,
Name 						CHAR(50),
Price 					INTEGER,
Category				CHAR(60),
PRIMARY KEY	(ItemID),
UNIQUE (Name));

CREATE TABLE Order
(OrderID 				INTEGER AUTO_INCREMENT,
CustId 					INTEGER,
StoreID 				INTEGER,
Status 					Char(20),
Instructions 		Char(200),
PickupTime			DATETIME,
Total 					INTEGER,
PRIMARY KEY	(OrderID),
FOREIGN KEY	(CustId) REFERENCES Customer(CustId),
FOREIGN KEY	(StoreID) REFERENCES Store(StoreID),
);

CREATE TABLE Containing
(OrderID 				INTEGER,
ItemID 					INTEGER,
Topping 				INTEGER,
Price           INTEGER,
PRIMARY KEY	(OrderID, ItemID),
FOREIGN KEY	(OrderID) REFERENCES Order(OrderID),
FOREIGN KEY	(ItemID) REFERENCES Item(ItemID),
FOREIGN KEY	(Topping) REFERENCES Item(ItemID),
);

INSERT INTO Store VALUES (1, 'verynicepw', '7789195432', '43 West 10th');

INSERT INTO Customer VALUES (1, 'cheers', 'Miguel', '604111111', 'miguel@valaro.com', 'B3H7G6');

INSERT INTO MenuItem VALUES (1, 'something', 5.55, 'smoothie');
INSERT INTO MenuItem VALUES (2, 'Topping', 5.55, 'topping');


INSERT INTO Order VALUES (1, 1, 1, 'received', "No Miguel please", '2019-01-31 13:00:00');

INSERT INTO Containing VALUES (1, 1, 2);
