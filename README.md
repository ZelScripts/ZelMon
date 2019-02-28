# ZelMon
A Simple Monitoring Script for ZelNodes

## NOTE: This script is for MainNet ZelNodes.

**NOTE:** This script is provided as is with no warranties of any kind.

**NOTE:** To run this version of the script, please use the same login that was used to install the ZelNode.

This script has been tested on Ubuntu Server 16.04 & 18.04.

***
## Requirements
1) **Already running ZelNode**
2) **SSH client such as [Putty](https://www.putty.org/)or [MobaXterm](https://mobaxterm.mobatek.net/)**

***
## Steps

1) **Connect to your VPS server console using PuTTY** terminal program

Please use the same login as was used to install the ZelNode.

2) **Download script & chmod as executable**

```
wget -O zelmon.sh https://raw.githubusercontent.com/ZelScripts/ZelMon/master/zelmon.sh && chmod +x zelmon.sh && bash ./zelmon.sh
```

The script will install jq package and display connected node addresses & your ZelNode sync status.

__NOTE:__ Please expand or maximize your terminal window so information can display properly.

3) **To run again** type the following into your terminal

```
bash ./zelmon.sh
```
