#!/bin/bash

# Wait for the database service to be ready
echo "Waiting for the database to be ready..."
while ! nc -z industrial-consulting-postgresql 5432; do   
  sleep 0.1
done
echo "Database is ready."

# Wait for Hasura to be ready
echo "Waiting for Hasura to be ready..."
while ! nc -z hasura 8080; do   
  sleep 0.1
done
echo "Hasura is ready."

echo "Checking if Hasura is fully ready..."
until $(curl --output /dev/null --silent --head --fail http://hasura:8080/healthz); do
    printf '.'
    sleep 5
done
echo "Hasura is fully operational."


# Apply metadata
echo "Applying Hasura metadata..."
hasura metadata apply --endpoint http://hasura:8080 --admin-secret postegres --log-level debug

# Start the Hasura GraphQL engine
echo "Starting Hasura GraphQL engine..."
graphql-engine serve
