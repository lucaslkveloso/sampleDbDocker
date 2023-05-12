# Use an official MySQL runtime as a parent image
FROM mysql:latest

# Set the root password for MySQL
ENV MYSQL_ROOT_PASSWORD password

# Create a new database called 'hotel'
ENV MYSQL_DATABASE hotel

# Copy the SQL file containing the table definitions into the container
COPY hotel_tables.sql /docker-entrypoint-initdb.d/
