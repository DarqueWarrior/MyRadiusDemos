#!/bin/bash 
 
echo "on-create start" >> ~/status

# download and install the Radius vs code extension 
wget https://get.radapp.dev/tools/vscode/stable/rad-vscode-bicep.vsix
code --install-extension rad-vscode-bicep.vsix
rm rad-vscode-bicep.vsix

# log into azure cli
az login --service-principal -t $TENANT -u $APPID -p $PASSWORD

# set the subscription
az account set -s $SUBID

# set defaults
az config set core.output=table

# install PowerShell modules
pwsh -Command "& {Install-Module -Name Trackyon.Utils, VSTeam, powershell-yaml -Force}"
 
echo "on-create complete" >> ~/status