#!/bin/bash

#grabbing host
hostname -I > ip.md

#pushing to git
git add .
git commit -m "new ip"
git push
