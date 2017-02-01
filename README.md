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
   /usr/lib/hadoop-hdfs
   /etc/hadoop/

   Spark:
   /srv/spark-1.6.1-bin-spark-1.6.1-bin-2.5.0-mr1-cdh5.3.1/

   DCC ETL
   /mnt/etl/dcc-release
```
