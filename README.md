# cd-group-ansible
This repository has configuration files for the CD Group project.  This
includes a developer portal, and Spark and HDFS clusters for DCC ETL.

The ansible playbook resources.yml creates OpenStack instances.  site.yml configures software and
services on those instances. The playbooks are separate because there isn't a
good way to wait for the availability of new OpenStack instances, and so that
site servers could be configured on non-OpenStack machines as well. 

Copy vars/main.yml.example to vars/main.yml and set the variables for your
environment.  To setup all machines and services, run

```
   ansible-playbook resources.yml
   ansible-playbook site.yml
```
site.yml includes several playbooks, such as etl.yml, which can be run
independently.
```
   ansible-playbook etl.yml
```
Some key locations for the installed services are
```
   HDFS:
   /usr/lib/hadoop-hdfs/
   /etc/hadoop/
   /var/log/hadoop-hdfs/

   Spark:
   /srv/spark-1.6.1-bin-spark-1.6.1-bin-2.5.0-mr1-cdh5.3.1/

   DCC ETL
   /mnt/etl/dcc-release/

   kibana
   /etc/kibana/kibana.yml

```
DCC uses an old version of Elasticsearch that is not supported by the role
available in ansible galaxy.  Currently node setup is done manually:
```
Elasticsearch Cluster
names: dcc-es-1 through dcc-es-4
Ubuntu 14.04
acc.half
4 64GB RAM machines
https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration.html

Starting ES Node
Associate temporary floating IP address to vm
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo wget
http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb
sudo dpkg -i elasticsearch-1.4.4.deb
sudo su -
echo "cluster.name: elasticsearch" >> /etc/elasticsearch/elasticsearch.yml
echo 'node.name: "dcc-es-1"' >> /etc/elasticsearch/elasticsearch.yml
echo "script.disable_dynamic: false" >> /etc/elasticsearch/elasticsearch.yml
echo "ES_HEAP_SIZE=12g" >> /etc/default/dcc-es-1_elasticsearch
exit

In /etc/elasticsearch/elasticsearch.yml, change node.name to 'dcc-es-1' through
'dcc-es-4' for each node.

sudo /usr/share/elasticsearch/bin/plugin -url http://bit.ly/29A1hsz -install
knapsack
sudo service elasticsearch start

After start up of all four, check that nodes connected properly into same
cluster:
curl -XGET localhost:9200/_nodes/_all/name/?pretty

to install head monitoring:

    /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head

    open http://localhost:9200/_plugin/head/
```
