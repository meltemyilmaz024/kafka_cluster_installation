#!/bin/bash


bin/kafka-topics.sh --bootstrap-server kafka01:9092 --create --topic first_topic

# Create topics with replication-factor 1
bin/kafka-topics.sh --bootstrap-server kafka01:9092 --create --topic second_topic --replication-factor 1 --partitions 3

# Publish data to Kafka using the bootstrap server list!
bin/kafka-console-producer.sh --bootstrap-server kafka01:9092,kafka02:9092,kafka03:9092 --topic second_topic

# we can read data using any broker too!
bin/kafka-console-consumer.sh --bootstrap-server kafka01:9092,kafka2:9092,kafka3:9092 --topic second_topic --from-beginning

# let's list topics
bin/kafka-topics.sh --bootstrap-server kafka01:9092 --list

# publish some data
bin/kafka-console-producer.sh --bootstrap-server kafka01:9092 --topic third_topic

# let's delete that topic
bin/kafka-topics.sh --bootstrap-server kafka01:9092 --delete --topic third_topic

# it should be deleted shortly:
bin/kafka-topics.sh --bootstrap-server kafka01:9092 --list
