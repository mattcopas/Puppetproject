#!/usr/bin/env bash

sudo yum update

yum install -y openssh-server
yum install -y openssh-client
yum install -y puppet