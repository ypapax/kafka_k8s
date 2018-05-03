#!/usr/bin/env bash
set -ex

zoo(){
	kubectl create --filename ./zookeeper.yml
}

zoo_service(){
	kubectl create --filename ./zookeeper-service.yml
}


kafka_service(){
	kubectl create -f ./kafka-service.yml
}

delete_kafka_service(){
	kubectl delete -f ./kafka-service.yml
}

kafka_cluster(){
	kubectl create -f ./kafka-cluster.yml
}

delete_kafka_cluster(){
	kubectl delete -f ./kafka-cluster.yml
}

EXTERNAL_IP=192.168.0.107

publish(){
	tail -f /var/log/system.log | kafkacat -b $EXTERNAL_IP:9092 -t topic1
}

publish_tee(){ # https://unix.stackexchange.com/questions/273118/direct-output-to-pipe-and-stdout#comment474127_273126
	tail -f /var/log/system.log | tee /dev/tty | kafkacat -b $EXTERNAL_IP:9092 -t topic1
}

consume(){
	kafkacat -b $EXTERNAL_IP:9092 -t topic1
}

$@