# kafka_cluster_installation



**Create First Topic**

bin/kafka-topics.sh --bootstrap-server kafka01:9092 --create --topic first_topic



**Create topics with replication-factor 1**

bin/kafka-topics.sh --bootstrap-server kafka01:9092 --create --topic second_topic --replication-factor 1 --partitions 3



**Publish data to Kafka using the bootstrap server list.**

bin/kafka-console-producer.sh --broker-list kafka01:9092,kafka02:9092,kafka03:9092 --topic second_topic



**Read data using any broker**

bin/kafka-console-consumer.sh --bootstrap-server kafka01:9092,kafka2:9092,kafka3:9092 --topic second_topic --from-beginning


**List topics**

bin/kafka-topics.sh --bootstrap-server kafka01:9092 --list



**Publish some data**

bin/kafka-console-producer.sh --bootstrap-server kafka01:9092 --topic third_topic



**Delete that topic**

bin/kafka-topics.sh --bootstrap-server kafka01:9092 --delete --topic third_topic
