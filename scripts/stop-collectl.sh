#!/bin/bash
#
CMD="sudo /etc/init.d/collectl stop"
echo stop collecting stats on workers.
for i in {1..12}; do
  if [ $i -eq 6 ]
  then
	  continue
  fi
  echo stop collectl on dcc-spark-worker-${i}
  ssh dcc-spark-worker-${i} "$CMD"
done
