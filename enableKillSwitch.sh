#!/bin/bash

sudo ufw reset

## LAN
#sudo ufw allow in to 192.168.178.0/24
#sudo ufw allow out to 192.168.178.0/24

## 127.0.0.1 for PiHole dashboard docker
#sudo ufw allow from 127.0.0.1 to 127.0.0.1 port 80 proto tcp
sudo ufw allow in to 172.18.0.1/16
sudo ufw allow out to 172.18.0.1/16

## Default Block All
sudo ufw default deny incoming
sudo ufw default deny outgoing

## Allow OpenVPN Connect
sudo ufw allow out to any port 1194 proto udp
sudo ufw allow out 53/udp

## Allow Incoming connection for BTCNode
sudo ufw allow 8333
sudo ufw allow 50001

## Route all traffic through VPN
sudo ufw allow out on tun0 from any to any
sudo ufw enable
