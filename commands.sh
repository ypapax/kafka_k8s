#!/usr/bin/env bash
set -ex

zoo(){
	kubectl create --filename ./zookeeper.yml
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

EXTERNAL_IP=192.168.0.107

publish(){
	tail -f /var/log/system.log | kafkacat -b $EXTERNAL_IP:9092 -t topic1
}

$@