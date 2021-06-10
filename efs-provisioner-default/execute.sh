#!/bin/bash

### PER SERVER SCRIPT ###
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
bold=`tput bold 1`
reset=`tput sgr0`

currentUser=$(oc config view -o jsonpath='{.users [?(@.user.token != "")] .name}')
currentCluster=$(oc config view -o jsonpath='{.clusters [].name}')

if [ -z "$currentUser" ]
then
    echo "${red}No Autheticated User${reset}"
    exit 1
fi

echo "=================== Current Cluster & User ======================= "
echo "${blue}Cluster: ${reset}${green}$currentCluster ${reset}"
echo "${blue}Auth User: ${reset}${green}$currentUser ${reset}"

read -p "${blue}Are you sure (y/n) - Please review the YAML values if correct...${reset} " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "${red}Aborting...${reset}"
    exit 1
fi

#### PER SERVER SCRIPT ####

oc create -f configmap.yaml -n default
oc create serviceaccount efs-provisioner
oc create -f clusterrole.yaml,clusterrolebinding.yaml,role.yaml,rolebinding.yaml
oc create -f storageclass.yaml
oc create -f provisioner.yaml
