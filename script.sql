USE hotel;

-- Insert some sample room data
INSERT INTO rooms (room_number, room_type, price) VALUES (101, 'Standard', 100.00);
INSERT INTO rooms (room_number, room_type, price) VALUES (102, 'Standard', 100.00);
INSERT INTO rooms (room_number, room_type, price) VALUES (201, 'Deluxe', 150.00);
INSERT INTO rooms (room_number, room_type, price) VALUES (202, 'Deluxe', 150.00);

-- Insert some sample guest data
INSERT INTO guests (name, email, phone_number) VALUES ('John Smith', 'john.smith@example.com', '555-1234');
INSERT INTO guests (name, email, phone_number) VALUES ('Jane Doe', 'jane.doe@example.com', '555-5678');

-- Insert some sample employee data
INSERT INTO employees (name, position, salary, hire_date) VALUES ('Alice Johnson', 'Manager', 50000.00, '2020-01-01');
INSERT INTO employees (name, position, salary, hire_date) VALUES ('Bob Jones', 'Receptionist', 25000.00, '2020-01-02');

-- Insert some sample booking data
INSERT INTO bookings (guest_name, room_id, check_in_date, check_out_date) VALUES ('John Smith', 1, '2022-01-01', '2022-01-03');
INSERT INTO bookings (guest_name, room_id, check_in_date, check_out_date) VALUES ('Jane Doe', 2, '2022-02-01', '2022-02-05');
INSERT INTO bookings (guest_name, room_id, check_in_date, check_out_date) VALUES ('John Smith', 3, '2022-03-01', '2022-03-04');
