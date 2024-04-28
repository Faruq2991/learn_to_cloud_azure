
#!/bin/bash

upload_to_azure() {
    local file_path=~/github_repos/learn_to_cloud_azure/clouduploader_project/helloWorld.txt
    
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
    storage_account="clouduploaderstorage1"
    container_name="clouduploadercontainer"
    
    # Upload file to Azure Blob Storage
    az storage blob upload --account-name "$storage_account" --container-name "$container_name" --file "$file_path" --name "helloWorld.txt"
    
    echo "File uploaded successfully to Azure Blob Storage."
}

# Call the function to upload the file
upload_to_azure
