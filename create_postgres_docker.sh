#!/bin/bash

# Clean up existing system
echo Y | docker system prune -a

# Build Docker file
docker build -t dvdrental-db .

# Run the docker File
docker run -d -p 5432:5432 dvdrental-db

# Provide command to connect
if [[ $(docker ps | grep -v CONTAINER) ]]
then 
   echo "INFO:  The database is up and running.  To connect, run "
   echo "psql -h localhost -p 5432 -U postgres -d dvdrental"
else
   echo "WARNING:  There don't appear to be any running containers. Look for errors!"
fi
