#!/bin/bash
# Packages
sudo apt-get update && \
      sudo apt-get -y install wget ca-certificates zip net-tools vim nano tar netcat

# Java Open JDK 8
sudo apt-get -y install openjdk-8-jdk
java -version

# Disable RAM Swap - can set to 0 on certain Linux distro
sudo sysctl vm.swappiness=1
echo 'vm.swappiness=1' | sudo tee --append /etc/sysctl.conf

# Update for other nodes**
sudo mkdir -p /data/zookeeper
sudo chown -R ubuntu:ubuntu /data/
# declare the server's identity
echo "1" > /data/zookeeper/myid

# Add hosts entries (mocking DNS) - put relevant IPs here
echo "192.168.56.127 kafka01
192.168.56.127 zookeeper01
192.168.56.128 kafka02
192.168.56.128 zookeeper02
192.168.56.129 kafka03
192.168.56.129 zookeeper03" | sudo tee --append /etc/hosts

# download Zookeeper and Kafka. Recommended is latest Kafka (0.10.2.1) and Scala 2.12
wget https://archive.apache.org/dist/kafka/3.4.0/kafka_2.12-3.4.0.tgz
tar -xvzf kafka_2.12-3.4.0.tgz
rm kafka_2.12-3.4.0.tgz
mv kafka_2.12-3.4.0 /usr/local/kafka
cd /usr/local/kafka

# UPDATE zookeeper.properties file**
nano /usr/local/ubuntu/kafka/config/zookeeper.properties

# Zookeeper quickstart
cat config/zookeeper.properties
bin/zookeeper-server-start.sh config/zookeeper.properties
# binding to port 2181 -> you're good. Ctrl+C to exit

# Testing Zookeeper install
# Start Zookeeper in the background
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
bin/zookeeper-shell.sh localhost:2181
ls /
# demonstrate the use of a 4 letter word
echo "ruok" | nc localhost 2181 ; echo

# Install Zookeeper boot scripts
sudo nano /etc/init.d/zookeeper
sudo chmod +x /etc/init.d/zookeeper
sudo chown root:root /etc/init.d/zookeeper
# you can safely ignore the warning
sudo update-rc.d zookeeper defaults
# stop zookeeper
sudo service zookeeper stop
# verify it's stopped
nc -vz localhost 2181
# start zookeeper
sudo service zookeeper start
# verify it's started
nc -vz localhost 2181
echo "ruok" | nc localhost 2181 ; echo
# check the logs
cat logs/zookeeper.out

# Test Zookeeper CLI
/usr/local/kafka/bin/zookeeper-shell.sh localhost:2181

# Display Root
ls /




