#!/bin/bash
# zelmon 1.0 - ZelCash Masternode Monitoring Script
# Adapted from Dwight007 of MANO community

#Processing command line params
if [ -z $1 ]; then dly=1; else dly=$1; fi   # Default refresh time is 1 sec

datadir="/home/$USER/.zelcash$2"   # Default datadir is ~/.zelcash
 
# Install jq if it's not present
dpkg -s jq 2>/dev/null >/dev/null || sudo apt-get -y install jq

#It is a one-liner script for now
watch -ptn $dly "echo '====================================================================================
Outbound connections to other ZelCash nodes [ZelCash datadir: $datadir]
====================================================================================
Node IP               Ping   Rx/Tx       Since    Hdrs     Height    Time   Ban
Address               (ms)  (KBytes)     Block    Syncd    Blocks    (min)  Score
===================================================================================='
zelcash-cli -datadir=$datadir getpeerinfo | jq -r '.[] | select(.inbound==false) | \"\(.addr),\(.pingtime*1000|floor) ,\
\(.bytesrecv/1024|floor)/\(.bytessent/1024|floor),\(.startingheight) ,\(.synced_headers) ,\(.synced_blocks)  ,\
\((now-.conntime)/60|floor) ,\(.banscore)\"' | column -t -s ',' && 
echo '===================================================================================='
uptime
echo '===================================================================================='
echo 'Sync Status: \n# zelcash-cli znsync status' &&  zelcash-cli -datadir=$datadir znsync status
echo '===================================================================================='
#echo 'ZelNode Status: \n# zelcash-cli getzelnodestatus' && zelcash-cli -datadir=$datadir getzelnodestatus
#echo '===================================================================================='
#echo 'ZelNode Information: \n# zelcash-cli getinfo' && zelcash-cli -datadir=$datadir getinfo
#echo '===================================================================================='
echo 'Usage: zelmon.sh [refresh delay] [datadir index]'
echo 'Example: zelmon.sh 10 22 will run every 10 seconds and query zelcashd in ~/.zelcash'
echo '\n\nPress Ctrl-C to Exit...'"
