# cd-group-ansible
configuration for CD Group infrastructure.

# To run the main cd-group portal VM

ansible-playbook -i config/hosts portal-main.yml

ssh portal-main

sudo uwsgi --ini /mnt/git/kafka-simple-monitor/build/app/kafka_mon.ini &


