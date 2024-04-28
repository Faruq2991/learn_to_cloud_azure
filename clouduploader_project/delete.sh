#!/bin/bash

echo "Delete"

echo "Are you sure you want to delete this resource group and all resources in it?"

read answer

if answer ="yes"; then

az group delete --name clouduploader-RG

fi