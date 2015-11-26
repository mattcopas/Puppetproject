#!/usr/bin/env bash

#generate a certificate from the agent
puppet agent --test --server=masterEvilcorp.evilcorp.com --waitforcert=30
puppet agent --enable