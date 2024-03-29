# Criação de um banco de dados simples para testes com docker
# Create a simple database to execute tests with docker

Execute o powerShell do windows

Criar um diretório
```
mkdir hotel-database
cd hotel-database
```
Crie um arquivo docker
```
touch Dockerfile
```
Caso possua o vsCode abra utilizando o comando
```
code .
```
Insira as seguintes informações no arquivo Dockerfile
```docker
# Use an official MySQL runtime as a parent image
FROM mysql:latest

# Set the root password for MySQL
ENV MYSQL_ROOT_PASSWORD password

# Create a new database called 'hotel'
ENV MYSQL_DATABASE hotel

# Copy the SQL file containing the table definitions into the container
COPY hotel_tables.sql /docker-entrypoint-initdb.d/

```
Crie um arquivo chamado hotel_tables.sql
```sql
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

```
Salve os arquivos

Execute o comando para buildar a imagem
```
docker build -t hotel-db .
```
Execute o comando para executar o mysql na porta padrão
```
docker run --name hotel-mysql -p 3306:3306 -d hotel-db
```
Crie um arquivo chamado script.sql na mesma pasta dos demais
```sql
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
```

Execute o comando abaixo para copiar o arquivo para dentro do container
```
docker cp script.sql hotel-mysql:/script.sql
```

Acesse o container
``` 
docker exec -it hotel-mysql /bin/bash
```

Acesse o mysql como administrador (a senha foi definida no arquivo docker)
```
mysql -u root -p
```

Acesse a database
```sql
USE hotel;
```
Execute o script de população das tabelas
```
source /script.sql;
```

E por fim execute os comandos
```
exit
exit
```

