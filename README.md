# kafka_cluster_installation



**1- Install Zookeeper Quorum with following s1-zookeeper-installartion file**


**2- Install Kafka Small Cluster (3 Brokers) with following s2-kafka-installartion file**

**3- Install Docker for Kafa UI with following s3-kafka-installartion file**

**3- Install Docker for Kafa UI with following docker-installation.sh and below steps**

**Install Docker**

ubuntu@kafka01:~$ chmod +x docker-installation.sh

ubuntu@kafka01:~$ ./docker-installation.sh

ubuntu@kafka01:~/containers$ sudo docker compose -f kafka-manager-docker-compose.yml up -d




