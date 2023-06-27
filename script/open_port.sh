#!/bin/bash
sudo iptables -I INPUT -p tcp -m tcp --dport $1 -j ACCEPT
sudo iptables --flush