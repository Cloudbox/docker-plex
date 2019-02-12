#!/bin/sh -e

netstat -ntlp | grep :32400 && mountpoint /mnt/unionfs