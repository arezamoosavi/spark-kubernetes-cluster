#!/bin/sh


set -o errexit
set -o nounset


echo "worker is sarting ...."

start-slave.sh ${spark_master}

echo "worker started at port 8081 ...."

sleep infinity