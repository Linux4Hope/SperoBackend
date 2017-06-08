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
