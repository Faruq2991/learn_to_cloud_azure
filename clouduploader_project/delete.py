#!/usr/bin/python3

print("Delete Resource")
action = "az group delete --name rG"
rG = input("Confirm resource group: ")
response = input("Are you sure you want to delete this resource along with all it's resources (y/n):").lower()

if response == "yes":
    resource_group = input("Enter resource group name: ")
    if resource_group == rG:
        print("This resource group " + rG + " will be deleted.")
    else:
        print("please input correct resource group.")
else:
    print("This action will be aborted.")
    quit()

