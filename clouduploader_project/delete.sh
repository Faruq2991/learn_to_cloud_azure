#!/bin/bash

echo "Delete"

echo "Are you sure you want to delete this resource group and all resources in it?"
read -r answer

echo "Enter RG name: "
read -r name

if [ "$answer" = "yes" ]; 
then
    az group delete --name $name --yes
else
    echo "Check the resource group name again."
fi
