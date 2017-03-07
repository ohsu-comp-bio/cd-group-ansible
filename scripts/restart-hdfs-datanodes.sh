#!/bin/bash

echo restart datanodes
for i in {1..12}; do
  echo restart datanode dcc-spark-worker-${i}
  ssh dcc-spark-worker-${i} "sudo service hadoop-hdfs-datanode restart"
done
