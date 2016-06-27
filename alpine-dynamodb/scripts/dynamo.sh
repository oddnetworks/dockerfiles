#! /bin/sh
exec java -Djava.library.path=/dynamo/DynamoDBLocal_lib -jar DynamoDBLocal.jar $@
