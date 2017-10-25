#!/bin/bash
netstat -s|grep "connections established"|awk '{print $1}'
