#!/bin/bash

cd /home/student334/CPSC334/raspberrypi

#grabbing host
hostname -I > ip.md

#pushing to git
git add .
git commit -m "new ip"
git push
