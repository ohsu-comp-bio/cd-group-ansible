#!/bin/bash
#
#
CMD="sudo /etc/init.d/collectl start"
echo collect stats on workers.
for i in {1..12}; do
  echo start collectl on dcc-spark-worker-${i}
  ssh dcc-spark-worker-${i} "$CMD"
done
