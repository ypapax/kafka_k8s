#!/usr/bin/env bash
set -ex

zoo(){
	kubectl create --filename ./zookeeper.yml
}

kafka_service(){
	kubectl create -f ./kafka-service.yml
}

kafka_cluster(){
	kubectl create -f ./kafka-cluster.yml
}

$@