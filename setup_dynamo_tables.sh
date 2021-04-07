#!/bin/bash

echo "/nDelete Existing Tables.." 

aws dynamodb delete-table --table-name Users --endpoint-url http://localhost:8000 --profile local

echo "\n\n Creating new tables now"

aws dynamodb create-table --endpoint-url http://localhost:8000 --profile local --cli-input-json file://user_table_creation.json

echo "Inserting Dummy Records.."

aws dynamodb put-item --table-name Users --item file://user_table_data.json --endpoint-url http://localhost:8000 --profile local

echo "Writing Item in Batch"

aws dynamodb batch-write-item  --request-items file://user_data.json --endpoint-url http://localhost:8000 --profile local

echo "/n/n Done .!!"


