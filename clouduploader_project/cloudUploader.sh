#!/bin/bash

upload_to_azure() {
    local file_path="$1"
    
    # Check if Azure CLI is installed
    if ! command -v az &> /dev/null; then
        echo "Azure CLI is not installed. Please install it before using this tool."
        exit 1
    fi
    
    # Check if file exists
    if [ ! -f "$file_path" ]; then
        echo "File not found: $file_path"
        exit 1
    fi
    
    # Azure storage account name and container name
    storage_account="<your_storage_account_name>"
    container_name="<your_container_name>"
    
    # Upload file to Azure Blob Storage
    az storage blob upload --account-name "$storage_account" --container-name "$container_name" --file "$file_path" --name "$(basename "$file_path")"
    
    echo "File uploaded successfully to Azure Blob Storage."
}

# Check if file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/file"
    exit 1
fi

file_path="$1"
upload_to_azure "$file_path"
