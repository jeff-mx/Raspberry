#!/bin/bash

# SCRIPT TO UPDATE RASPBERRY
# JEFFMX
# EXECUTE AS SUPER USER (SUDO)

ScriptDir=$PWD
rpi_model="$(tr -d '\0' < /proc/device-tree/model)"

#SETTING THIS VARIABLE = 1 SCRIPT WILL DISPLAY OUTPUT, DEFAULT = 0
OutputEnable=0

if [[ $OutputEnable -eq 1 ]]; then
        echo -e "\n== EXECUTING UPDATE [$(date +"%T")] =="
fi

sudo apt-get -y update

if [[ $OutputEnable -eq 1 ]]; then
        echo -e "\n== EXECUTING UPGRADE [$(date +"%T")] =="
fi

sudo apt-get -y upgrade

if [[ $OutputEnable -eq 1 ]]; then
        echo -e "\n== EXECUTING DIST-UPGRADE [$(date +"%T")] =="
fi

sudo apt-get dist-upgrade

if [[ $OutputEnable -eq 1 ]]; then
        echo -e "\n== EXECUTING RASPI-CONFIG [$(date +"%T")] =="
fi

sudo apt-get install -y raspi-config

if [[ $OutputEnable -eq 1 ]]; then
        echo -e "\n== EXECUTING AUTO-REMOVE [$(date +"%T")] =="
fi

sudo apt-get -y autoremove

if [[ $OutputEnable -eq 1 ]]; then
echo -e "\n== NOW ${rpi_model^^} IS UPDATED =="
echo -e "\n update.log >> $ScriptDir/update.log"
fi

echo "SYSTEM UPDATE COMPLETED [$(date)]" >> $ScriptDir/update.log 2>&1
