#!/usr/bin/env bash
set -ex

zoo(){
	kubectl create --filename ./zookeeper.yml
}

$@