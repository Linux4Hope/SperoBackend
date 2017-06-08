--Look up computers donated by one individual.
SELECT cSerialNumber, make, model, processor, storage, ram
FROM Computer NATURAL JOIN Users
WHERE email = 'michael@michael.com';

--Look up specific computer(s) donated to a person or entity.
-- should the "new computer" created have its own generated serial number?

--Look up all computers signed off by one officer/branch.
-- signed off? as in donations or requesting?

--Look up computers where recycled status is true.
SELECT cSerialNumber FROM Computer
WHERE recycledStatus = 'True';   -- currently recycled status isn't a booleen. it's a varchar

--Look up specific computer by serial number.
SELECT * FROM Computer
WHERE cSerialNumber = '3897439793939';

--Look up specific computer by processor, ram, storage.
SELECT bLocation, cSerialNumber, make, model, processor, storage, ram FROM Computer
WHERE processor = 'test' && ram = 'test' && storage = 'test';

--Look up all computer by specific make or model.
SELECT bLocation, cSerialNumber, make, model, processor, storage, ram FROM Computer
WHERE make = 'test' && model = 'test';

--Look up all computers by a specific part installed in it.
-- is this for final product?

--Look up all parts available.
SELECT bLocation, pSerialNumber, pType FROM Part;

--Look up all parts by part type (storage, ram, optical drive, etc).
SELECT bLocation, pSerialNumber, pTYpe FROM Part
WHERE pType = 'RAM';

--Look up all computers donated by specific date or date range.
-- donated to linux or to the person?

--Find all donations.
SELECT * FROM Donation NATURAL JOIN Part;
SELECT * FROM Donation NATURAL JOIN Computer;
SELECT * FROM Donation NATURAL JOIN Monetary;

--Find all donations by date (specific or range), donee, or signed off by officer.
SELECT * FROM FinalProduct NATURAL JOIN FP_Comp F
INNER JOIN Computer C
WHERE F.cSerialNumber = C.cSerialNumber;

--Find all expenses.
--Find all expenses by date (specific or range), paid to whom, or signed off by officer.
--Calculate all donations by date (specific or range).
--Calculate all expenses by date (specific or range).

--Find all submissions for specific email address.
SELECT * FROM Users NATURAL JOIN Application
WHERE email = 'sara@sara.com';

--Find all donation application (specific date, range of dates, email address).
SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Donation)
&& aDate = '2017-05-10';

SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Donation)
&& (aDate BETWEEN '2017-05-10' AND '2017-06-01');

SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Donation)
&& email = 'michael@michael.com';

--Find all requesting applications (specific date, range of dates, email address).
SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Request)
&& aDate = '2015-01-25';

SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Request)
&& (aDate BETWEEN '2015-01-01' AND '2015-12-31');

SELECT * FROM Users NATURAL JOIN Application
WHERE userID IN
    (SELECT userID FROM Request)
&& email = 'sara@sara.com';