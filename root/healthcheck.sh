#!/bin/sh -e

netstat -ntl | grep :32400 && mountpoint /mnt/unionfs