# kafka_cluster_installation


**Kafka Small Cluster On-Premise Installation on Ubuntu 22.04**



1- Install Zookeeper Quorum with following s1-zookeeper-installartion File

2- Install Kafka Small Cluster (3 Brokers) with Following s2-kafka-installartion File

3- Cluster Testing with s3-test-kafka-cluster File

4- Install Docker for Kafa UI with Following docker-installation.sh and below steps

**Install Docker**

ubuntu@kafka01:~$ chmod +x docker-installation.sh

ubuntu@kafka01:~$ ./docker-installation.sh

ubuntu@kafka01:~/containers$ sudo docker compose -f kafka-manager-docker-compose.yml up -d




