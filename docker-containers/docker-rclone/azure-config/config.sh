#!/bin/bash

function help(){
	printf '

VBL r-clone setup

	* an rclone config must exist at ~/.config/rclone/rclone.conf
	* Resource Group: rg-PROJECTNAME-ENVIRONMENT eg rg-testproject-dev
	* Keyvault : vault-PROJECTNAME eg vault-testproject
	* Values : key-PROJECTNAME-ENVIRONMENT / source-path / target-path / schedule-ENVIRONMENT
'	exit 0
}


if ! [ -f ~/.config/rclone/rclone.conf ]; then help; fi 
if [ "$1" == "--help" ]; then help; fi

read -p "Enter Project Name: "  PROJECTNAME
read -p "Enter SP ID (leave blank to set one up): " SPID
read -p "Enter Environment (lowercase): " ENV

echo " "
cat ~/.config/rclone/rclone.conf | grep -A4 source
echo " " 
read -p "For the source above, enter the path: " SOURCE_PATH

echo " "
cat ~/.config/rclone/rclone.conf | grep -A4 target
echo " "
read -p "For the target above, enter the path: " TARGET_PATH 

RG=rg-${PROJECTNAME}-${ENV}

az group create --location "West Europe" --name rg-${PROJECTNAME}-${ENV} -o tsv


if [ ! ${SPID} ]
then
	APPID=$(az ad app list --query "[?displayName=='svc_${PROJECTNAME}-${ENV}'].[appId]" -o tsv)
	if [ ! ${APPID} ]; then APPID=$(az ad app create --display-name svc_${PROJECTNAME}-${ENV} --identifier-uris https://${PROJECTNAME}-${ENV}-vanquisbank.co.uk --query appId); fi
	SPID=${APPID}
else
	3cho seatch appid
fi


function create_secret(){
	if [ -f ~/.config/rclone/rclone.conf ]; then CONFIG=$(cat ~/.config/rclone/rclone.conf | base64 -w0); else exit 0; fi
	az keyvault secret set --name key-${PROJECTNAME}-${ENV} --value ${CONFIG} --description "Project ${PROJECTNAME} ${ENV} secret for ${ENV}" --vault-name vault-${PROJECTNAME}
	az keyvault secret set --name source-${PROJECTNAME}-${ENV} --value ${SOURCE_PATH} --description "Project ${PROJECTNAME} ${ENV} SOURCE  PATH for ${ENV}" --vault-name vault-${PROJECTNAME}
	az keyvault secret set --name target-${PROJECTNAME}-${ENV} --value ${TARGET_PATH} --description "Project ${PROJECTNAME} ${ENV} TARGET PATH ${ENV}" --vault-name vault-${PROJECTNAME}
}

function create_service_principal(){
	SPID=$(az ad sp create --id ${APPID} --query spId)
}

function create_vault(){
       az keyvault create --location "West Europe" --resource-group ${RG}  --name vault-${PROJECTNAME}
#       az keyvault set-policy --name ${ENV}-policy --secret-permissions get list --spn ${APPID}
}


function check_components() {

#	CHECK_APPID=$(az ad app list --query "[?displayName=='svc_${PROJECTNAME}-${ENV}'].[appId]" -o tsv)
#	if [ ! ${CHECK_APPID} ]; then CHECK_APPID=$(az ad app create --display-name svc_${PROJECTNAME}-${ENV} --identifier-uris https://${PROJECTNAME}-${ENV}-vanquisbank.co.uk --query appId); fi

	CHECK_VAULT=$(az keyvault list --query "[?name=='vault-${PROJECTNAME}'].[name]" -o tsv)
	if [ ! ${CHECK_VAULT} ]; then create_vault; fi 
		
	create_secret

}



check_components

#
#if ! [ -f ~/.config/rclone/rclone.conf ]; then NOCONF=true; fi


#cat ~/.config/rclone/rclone.conf | base64 -w0


