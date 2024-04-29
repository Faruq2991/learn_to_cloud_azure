#!/bin/bash

echo "Login"

#az login

echo "Enter a Resource Group name and Location: "

read resource_group location


az group create --name $resource_group --location $location