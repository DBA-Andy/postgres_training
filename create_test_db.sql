-- Create the test database
CREATE DATABASE dvdrental;

\i /docker-entrypoint-initdb.d/restore.sql

