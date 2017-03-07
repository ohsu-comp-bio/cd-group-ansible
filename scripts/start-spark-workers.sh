#!/bin/bash

echo start workers
for i in {1..12}; do
  echo start dcc-spark-worker-${i}
  ssh dcc-spark-worker-${i} "sudo /srv/spark-1.6.1-bin-spark-1.6.1-bin-2.5.0-mr1-cdh5.3.1/sbin/start-slave.sh spark://10.60.60.55:7077"
done
