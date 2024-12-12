# Use the official PostgreSQL image as the base 
FROM postgres:latest
# Set the environment variable for the database user and password
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Install tools for downloading and extracting
RUN apt-get update && apt-get install -y curl unzip

# Create a directory for downloaded files
WORKDIR /tmp

# Download the DVD Rental database archive
RUN apt-get update && \
    apt-get install -y curl unzip procps vim sed && \
    curl -L https://neon.tech/postgresqltutorial/dvdrental.zip -o dvdrental.zip && \
    unzip dvdrental.zip && \
    tar -xvf dvdrental.tar -C /docker-entrypoint-initdb.d && \
    sed -i "s/'English_United States.1252'/'en_US.UTF-8'/g" /docker-entrypoint-initdb.d/restore.sql && \
    sed -i "s/\$\$\PATH\$\$\//\/docker-entrypoint-initdb.d\//g" /docker-entrypoint-initdb.d/restore.sql

# Create a SQL script to create and import the test database
COPY create_test_db.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5432
