#!/bin/bash

BITCOINCLI="docker exec zenyd bitzeny-cli"
MEMPOOLHOME=/home/mempool/mempool
TMPFILE=/tmp/rawdump.txt
mkdir -p /tmp

cd $MEMPOOLHOME
rm -f $TMPFILE
$BITCOINCLI getrawmempool true > $TMPFILE
perl mempool-sql.pl < $TMPFILE

./mkdata.sh
