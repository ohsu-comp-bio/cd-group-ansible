#!/bin/bash

echo re-start hdfs namenode
ssh dcc-etl-2 "sudo service hadoop-hdfs-namenode restart"
