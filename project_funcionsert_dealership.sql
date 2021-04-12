

-- Stored Function to add customer to customer table
CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_billing_info VARCHAR,
	_address VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, billing_info, address)
	VALUES(_customer_id, _first_name, _last_name, _billing_info, _address);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add customer
SELECT add_customer(1,'Chip','Monk','1111 1111 1111 1111 111 11/11','333 Road St Chicago, IL 60614');
SELECT add_customer(2,'Polly', 'Ester', '1212 1212 1212 1212 121 12/12', '123 Fakers St Chicago, IL 60625');
SELECT add_customer(3,'Aka', 'Pella', '2222 2222 1111 1111 222 02/22', '111 Somethins Rd City, TY 12344'); 
SELECT add_customer(4, 'Billy', 'Whatshisname', '7777 7777 1111 1111 777 07/77', '777 Folk Dr Wowerzville, DK 77320');



-- Stored Function to insert data into the salespeople table
CREATE OR REPLACE FUNCTION add_salesperson(
	_sales_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson(sales_id, first_name, last_name)
	VALUES(_sales_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to insert salesperson
SELECT add_salesperson(1,'Krystal', 'Ball');
SELECT add_salesperson(2,'Kerry', 'Oki');



-- Stored Function to insert data into dealer_car table
CREATE OR REPLACE FUNCTION add_dealer_car(
	_dealer_id INTEGER,
	_make VARCHAR,
	_model VARCHAR,
	_dealer_year INTEGER,
	_color VARCHAR,
	_price NUMERIC(8,2),
	_status VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO dealer_car(dealer_id, make, model, dealer_year, color, price, status)
	VALUES(_dealer_id, _make, _model, _dealer_year, _color, _price, _status);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add cars to dealership
SELECT add_dealer_car(1, 'Land Rover', 'whatchamacallit', '1997', 'Black', '45000', 'used');
SELECT add_dealer_car(2, 'Buick', 'Enclave', '2021', 'Green', '50000', 'new');




-- Stored Function to insert data into the mechanic table
CREATE OR REPLACE FUNCTION add_mechanic(
	_mechanic_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;

--Call of Function to add mechanics
SELECT add_mechanic(1, 'Jo', 'King');
SELECT add_mechanic(2, 'Rocky', 'Rhoades');




-- Stored Function to insert data into the parts 
CREATE OR REPLACE FUNCTION add_parts(
	_parts_id INTEGER,
	_parts_type VARCHAR,
	_parts_cost NUMERIC(6,2)
)
RETURNS void
AS $$
BEGIN
	INSERT INTO parts(parts_id, parts_type, parts_cost)
	VALUES(_parts_id, _parts_type, _parts_cost);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add parts to dealership shop
SELECT add_parts(1, 'Engine Salt', '10.00');
SELECT add_parts(2, 'Thingy', '1200.00');
SELECT add_parts(3, 'Oneofthosethings', '50.00');



-- Stored Function to make invoice for car sale
CREATE OR REPLACE FUNCTION add_invoice(
	_invoice_id INTEGER,
	_sales_id INTEGER,
	_dealer_id INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO invoice(invoice_id, sales_id, dealer_id, customer_id)
	VALUES(_invoice_id, _sales_id, _dealer_id, _customer_id);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add invoices 
SELECT add_invoice(1, 1, 1, 1);
SELECT add_invoice(2, 2, 2, 2);



-- Stored Function to add a customer's car to the service table
CREATE OR REPLACE FUNCTION add_c_car(
	_car_id INTEGER,
	_make VARCHAR,
	_model VARCHAR,
	_ccar_year INTEGER,
	_color VARCHAR,
	_mileage INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO c_car(car_id, make, model, ccar_year, color, mileage, customer_id)
	VALUES(_car_id, _make, _model, _ccar_year, _color, _mileage, _customer_id);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add cars to autoshop
SELECT add_c_car(1, 'Tesla', 'Model X', '2021', 'White', '56000', 3);
SELECT add_c_car(2, 'Mustang', 'Shelby GT500', '1974', 'Steel Grey', '20000', 4);



-- Stored Function to insert data into the service ticket table 
CREATE OR REPLACE FUNCTION add_service_ticket(
	_service_id INTEGER,
	_service_cost NUMERIC(6,2),
	_service_type VARCHAR,
	_status VARCHAR,
	_car_id INTEGER,
	_mechanic_id INTEGER,
	_parts_id INTEGER
	
)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_ticket(service_id, service_cost, service_type, status, car_id, mechanic_id, parts_id)
	VALUES(_service_id, _service_cost, _service_type, _status, _car_id, _mechanic_id, _parts_id);
END;
$$
LANGUAGE plpgsql;

-- Call of Function to add service tickets to table
SELECT add_service_ticket(1, '150.00', 'Thingy Replacement', 'COMPLETE', 2, 2, 2); 
SELECT add_service_ticket(2,'100.00', 'Needs Oneofthosethings', 'NOT COMPLETE', 1, 1, 3);

SELECT *
FROM service_ticket;

