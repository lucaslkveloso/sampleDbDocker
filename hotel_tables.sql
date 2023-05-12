USE hotel;

# Create the 'rooms' table
CREATE TABLE rooms (
  id INT NOT NULL AUTO_INCREMENT,
  room_number INT NOT NULL,
  room_type VARCHAR(50),
  price DECIMAL(10, 2),
  PRIMARY KEY (id)
);

# Create the 'bookings' table
CREATE TABLE bookings (
  id INT NOT NULL AUTO_INCREMENT,
  guest_name VARCHAR(255) NOT NULL,
  room_id INT NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);

# Create the 'guests' table
CREATE TABLE guests (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone_number VARCHAR(20),
  PRIMARY KEY (id)
);

# Create the 'employees' table
CREATE TABLE employees (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (id)
);
