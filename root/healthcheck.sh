#!/bin/sh -e

ss -ltu | grep :32400 && mountpoint /mnt/unionfs