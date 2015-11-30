#!/usr/bin/env bash

#generate a certificate from the agent
sudo puppet agent --test --server=masterEvilcorp.evilcorp.com --waitforcert=30
sudo puppet agent --enable -v