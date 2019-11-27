#!/bin/bash
# cp /mnt/hgfs/Import/py51new/* -r ./
rm -f book.pdf
gitbook build --gitbook=2.6.7
gitbook pdf .
