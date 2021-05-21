#!/bin/bash
### PER SERVER SCRIPT ###
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
bold=`tput bold 1`
reset=`tput sgr0`

read -p "${blue}Are you sure (y/n)?${reset} " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "${red}Aborting...${reset}"
    exit 1
fi

#(oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-cmpt1 | echo aim-steps-prod-openshift-cmpt1 $(wc -l)) && (oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-cmpt2 | echo aim-steps-prod-openshift-cmpt2 $(wc -l)) && (oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-cmpt3 | echo aim-steps-prod-openshift-cmpt3 $(wc -l))
#(oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-log1 | echo aim-steps-prod-openshift-log1 $(wc -l)) && (oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-log2 | echo aim-steps-prod-openshift-log2 $(wc -l)) && (oc get pods --all-namespaces -o wide | grep aim-steps-prod-openshift-log3 | echo aim-steps-prod-openshift-log3 $(wc -l))

echo "===================Max Number of Pods======================= "
ycmpt1=$(oc describe nodes aim-steps-prod-openshift-cmpt1 | grep 'pods:' | awk 'NR>1{ print $2 }')
ycmpt2=$(oc describe nodes aim-steps-prod-openshift-cmpt2 | grep 'pods:' | awk 'NR>1{ print $2 }')
ycmpt3=$(oc describe nodes aim-steps-prod-openshift-cmpt3 | grep 'pods:' | awk 'NR>1{ print $2 }')
ylog1=$(oc describe nodes aim-steps-prod-openshift-log1 | grep 'pods:' | awk 'NR>1{ print $2 }')
ylog2=$(oc describe nodes aim-steps-prod-openshift-log2 | grep 'pods:' | awk 'NR>1{ print $2 }')
ylog3=$(oc describe nodes aim-steps-prod-openshift-log3 | grep 'pods:' | awk 'NR>1{ print $2 }')

echo "aim-steps-prod-openshift-cmpt1: ${blue}$ycmpt1${reset}"
echo "aim-steps-prod-openshift-cmpt2: ${blue}$ycmpt2${reset}"
echo "aim-steps-prod-openshift-cmpt3: ${blue}$ycmpt3${reset}"
echo "aim-steps-prod-openshift-log1: ${blue}$ylog1${reset}"
echo "aim-steps-prod-openshift-log2: ${blue}$ylog2${reset}"
echo "aim-steps-prod-openshift-log3: ${blue}$ylog3${reset}"

yTotal=$(($ycmpt1 + $ycmpt2 + $ycmpt3 + $ylog1 + $ylog2 + $ylog3))
echo "Maximum Pod Count: ${bold}${red}$yTotal${reset}"

echo "======================Number of Pods======================== "
xcmpt1=$(oc describe nodes aim-steps-prod-openshift-cmpt1 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')
xcmpt2=$(oc describe nodes aim-steps-prod-openshift-cmpt2 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')
xcmpt3=$(oc describe nodes aim-steps-prod-openshift-cmpt3 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')
xlog1=$(oc describe nodes aim-steps-prod-openshift-log1 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')
xlog2=$(oc describe nodes aim-steps-prod-openshift-log2 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')
xlog3=$(oc describe nodes aim-steps-prod-openshift-log3 | grep 'Non-terminated Pods' | grep -Eo '[0-9]{1,4}' | awk '{ print $1 }')

echo "aim-steps-prod-openshift-cmpt1: ${blue}$xcmpt1${reset}" 
echo "aim-steps-prod-openshift-cmpt2: ${blue}$xcmpt2${reset}" 
echo "aim-steps-prod-openshift-cmpt3: ${blue}$xcmpt3${reset}" 
echo "aim-steps-prod-openshift-log1: ${blue}$xlog1${reset}" 
echo "aim-steps-prod-openshift-log2: ${blue}$xlog2${reset}"
echo "aim-steps-prod-openshift-log3: ${blue}$xlog3${reset}"

xTotal=$(($xcmpt1 + $xcmpt2 + $xcmpt3 + $xlog1 + $xlog2 + $xlog3))

if [ "$xTotal" -gt "$yTotal" ]; then
    echo "Total Number of Pods Running: ${bold}${red}$xTotal${reset}"
else
    echo "Total Number of Pods Running: ${bold}${green}$xTotal${reset}"
fi