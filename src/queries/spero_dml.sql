-- populate Branch class with mock data
INSERT INTO Branch(bLocation, bStreetAddress, bCity, bState, bZip) VALUES
    ('Los Angeles', '1234 test ave', 'Los Angeles', 'CA', '98343'),
    ('San Francisco', '8734 Marian Dr', 'San Francisco', 'CA', '3432'),
    ('Oahu', '2433 Jaylen St', 'Oahu', 'HI', '65343');

-- populate Income class with mock data
INSERT INTO Income(bLocation, incomeDate, obtainedFrom, amount, reason) VALUES
    ('Los Angeles', '2015-01-21', 'HBO Go', 350.50, 'reason for income 1'),
    ('Los Angeles', '2016-03-23', 'Disneyland', 400, 'reason for income 2'),
    ('Los Angeles', '2017-06-03', 'Michael', 232.23, 'reason for income 3'),
    ('San Francisco', '2014-01-21', 'CSULB', 100, 'reason for income 1'),
    ('San Francisco', '2017-04-30', 'CSUF', 54.60, 'reason for income 2'),
    ('San Francisco', '2017-05-15', 'CSUDH', 298.34, 'reason for income 3'),
    ('Oahu', '2016-01-01', 'Nguyen', 50, 'reason for income 1'),
    ('Oahu', '2016-02-01', 'Nguyen', 50, 'reason for income 2'),
    ('Oahu', '2016-03-01', 'Nguyen', 50, 'reason for income 3');

-- populate Expenses class with mock data
INSERT INTO Expenses(bLocation, paymentDate, paidTo, amount, reason) VALUES
    ('Los Angeles', '2014-01-21', 'Person', 25, 'reason for payment 1'),
    ('Los Angeles', '2015-03-23', 'Location', 150, 'reason for payment 2'),
    ('Los Angeles', '2016-06-03', 'Company', 75, 'reason for payment 3'),
    ('San Francisco', '2015-01-21', 'Person', 50, 'reason for payment 1'),
    ('San Francisco', '2016-04-30', 'Person', 50, 'reason for payment 2'),
    ('San Francisco', '2017-05-15', 'Person', 50, 'reason for payment 3'),
    ('Oahu', '2017-04-10', 'Company', 85, 'reason for payment 1'),
    ('Oahu', '2017-05-10', 'Company', 65, 'reason for payment 2'),
    ('Oahu', '2017-06-10', 'Company', 70, 'reason for payment 3');

-- populate Users class with mock data
INSERT INTO Users(userID, firstName, lastName, email, phone, password) VALUES
    (100, 'Marian', 'Stark', 'marian@marian.com', '814-934-3232', 'test'),
    (101, 'Jaylen', 'Snow', 'jaylen@jaylen.com', '834-343-3432', 'test'),
    (102, 'Alan', 'Lannister', 'alan@alan.com', '793-342-0934', 'test'),
    (103, 'Narith', 'Who?', 'narith@narith.com', '234-242-2324', 'test'),
    (104, 'Cherie', 'Tyrell', 'cheri@cheri.com', '232-232-2343', 'test'),
    (105, 'Michael', 'Stark', 'michael@michael.com', '945-453-3432', 'test'),
    (106, 'Emily', 'Who?', 'emily@emily.com', '934-242-2442', 'test'),
    (107, 'Sara', 'Tyrell', 'sara@sara.com', '834-232-2343', 'test'),
    (108, 'Chris', 'Mormont', 'chris@chris.com', '812-343-2353', 'test'),
    (109, 'Tony', 'HODOR', 'tony@tony.com', '634-934-3132', 'test');

-- populate Guest class with mock data
INSERT INTO Guest(userID) VALUES
    (105),
    (106),
    (107),
    (108),
    (109);

-- populate Officer class with mock data
INSERT INTO Officer(userID, streetAddress, city, state, zip) VALUES
    (100, '234 Foo St', 'Garden Grove', 'CA', '93432'),
    (101, '943 Dragon Ave', 'Dragonstone', 'NY', '47923'),
    (102, '5643 Coding Blvd', 'Code', 'AZ', '34232'),
    (103, '8723 Candy St', 'Chocolate', 'UT', '87343'),
    (104, '434 Green Cir', 'Blue', 'KS', '23577');

-- populate Application class with mock data
INSERT INTO Application(officerID, userID, bLocation, aDate, aStreetAddress, aCity, aState, aZip, status)
VALUES
    (100, 105, 'Los Angeles', '2017-05-10', '232 Test St', 'Fake City', 'CA', '66943', 'Approved'),
    (104, 105, 'Los Angeles', '2017-06-01', '9992 Candy Ave', 'Lake City', 'NZ', '93422', 'Approved'),
    (102, 107, 'Los Angeles', '2015-05-28', '23452 Mouse Blvd', 'Computer', 'FB', '93422', 'Approved'),
    (103, 109, 'San Francisco', '2016-09-01', '9342 Mac Cir', 'Cheese', 'HL', '99321', 'Under Review'),
    (102, 108, 'San Francisco', '2016-07-30', '9924 Paper St', 'White', 'BL', '92324', 'Approved'),
    (101, 106, 'Oahu', '2015-01-25', '2342 Hello St', 'World', 'JP', '34532', 'Approved'),
    (102, 107, 'Los Angeles', '2014-01-01', '23452 Mouse Blvd', 'Computer', 'FB', '93422', 'Approved');

INSERT INTO Donation(dOfficerID, donatedBy, bLocation, aDate, dQuestion) VALUES
    (100, 105, 'Los Angeles', '2017-05-10', 'application answers entered here'),
    (104, 105, 'Los Angeles', '2017-06-01', 'application answers entered here'),
    (102, 108, 'San Francisco', '2016-07-30', 'application answers entered here');

INSERT INTO Request(rOfficerID, requestedBy, bLocation, aDate, rQuestion) VALUES
    (102, 107, 'Los Angeles', '2015-05-28', 'application answers entered here'),
    (102, 107, 'Los Angeles', '2014-01-01', 'application answers entered here'),
    (103, 109, 'San Francisco', '2016-09-01', 'application answers entered here'),
    (101, 106, 'Oahu', '2015-01-25', 'application answers entered here');

INSERT INTO Part(dOfficerID, donatedBy, aDate, bLocation, pSerialNumber, pType, notes) VALUES
    (100, 105, '2017-05-10', 'Los Angeles', '893470482042', 'RAM', 'extra notes'),
    (100, 105, '2017-05-10', 'Los Angeles', '930853895083', 'Processor', 'extra notes'),
    (100, 105, '2017-05-10', 'Los Angeles', '763453985793', 'RAM', 'extra notes'),
    (100, 105, '2017-05-10', 'Los Angeles', '232425353225', 'Camera', 'extra notes'),
    (100, 105, '2017-05-10', 'Los Angeles', '923254086493', 'Shell', 'extra ntoes');

INSERT INTO Computer(dOfficerID, donatedBy, bLocation, aDate, cSerialNumber, make, model, processor, storage, ram, conditionStatus, recycledStatus, notes)
VALUES
    (104, 105, 'Los Angeles', '2017-06-01', '9383888888834', 'test', 'test', 'test', 'test', 'test', 'test', 'test','test'),
    (104, 105, 'Los Angeles', '2017-06-01', '3897439793939', 'test', 'test', 'test', 'test', 'test', 'test', 'test','test');

INSERT INTO Monetary(dOfficerID, donatedBy, bLocation, aDate, amount) VALUES
    (102, 108, 'San Francisco', '2016-07-30' , 100);

INSERT INTO FinalProduct(rOfficerID, requestedBy, bLocation, aDate, dateDonated, operatingSystem) VALUES
    (101, 106, 'Oahu', '2015-01-25', '2015-03-13', 'Sierra'),
    (102, 107, 'Los Angeles', '2015-05-28', '2015-07-01', 'Ubuntu'),
    (102, 107, 'Los Angeles', '2014-01-01', '2014-03-17', 'Windows');

INSERT INTO FP_Parts(rOfficerID, requestedBy, bLocation, dateDonated, pSerialNumber) VALUES
    (101, 106, 'Oahu', '2015-03-13', '893470482042'),
    (101, 106, 'Oahu', '2015-03-13', '930853895083'),
    (101, 106, 'Oahu', '2015-03-13', '232425353225');

INSERT INTO FP_PartComp(rOfficerID, requestedBy, bLocation, dateDonated, cSerialNumber, pSerialNumber) VALUES
    (102, 107, 'Los Angeles', '2015-07-01', '9383888888834', '763453985793'),
    (102, 107, 'Los Angeles', '2015-07-01', '9383888888834', '923254086493');

INSERT INTO FP_Comp(rOfficerID, requestedBy, bLocation, dateDonated, cSerialNumber) VALUES
    (102, 107, 'Los Angeles', '2014-03-17', '3897439793939');


SELECT * FROM Branch;
SELECT * FROM Income;
SELECT * FROM Expenses;
SELECT * FROM Users;
SELECT * FROM Guest;
SELECT * FROM Officer;
SELECT * FROM Application;
SELECT * FROM Donation;
SELECT * FROM Request;
SELECT * FROM Part;
SELECT * FROM Computer;
SELECT * FROM Monetary;
SELECT * FROM FinalProduct;
SELECT * FROM FP_Parts;
SELECT * FROM FP_PartComp;
SELECT * FROM FP_Comp;