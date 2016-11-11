# cd-group-ansible
configuration for CD Group infrastructure.

# To run the main cd-group portal VM

ansible-playbook -i config/hosts portal-main.yml

ssh portal-main

cd /mnt/git/kafka-simple-monitor/build/app/

sudo uwsgi --ini kafka_mon.ini &

cd /mnt/dist/kafka-manager/

sudo bin/kafka-manager -Dapplication.home=$(pwd) -Dconfig.file=./conf/application.conf &

close terminal
