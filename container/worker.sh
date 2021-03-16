#!/bin/sh


set -o errexit
set -o nounset


echo "worker is sarting ...."

start-worker.sh ${spark_master}

echo "worker started at port 8081 ...."

sleep infinity