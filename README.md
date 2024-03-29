# Build infrastructure AZURE
## What is Infrastructure as Code with Terraform?
 terraform show`** 
**`Infrastructure as Code (IaC)`** tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to **`build, change, and manage your infrastructure`**  in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

Terraform is HashiCorp's infrastructure as code tool. It lets you define resources and infrastructure in human-readable, declarative configuration files, and manages your infrastructure's lifecycle. Using Terraform has several advantages over manually managing your infrastructure

![App Screenshot](https://launchrack.com/assets/img/blog/iac-and-terraform-between-text.png)

# Prerequisites
## Install the Azure CLI tool

```powershell
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
```

## Authenticate using the Azure CLI
1. In your terminal, use the Azure CLI tool to setup your account permissions locally.
```Azure
az login
```
```AZ
# output
You have logged in. Now let us find all the subscriptions to which you have access...

[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "xxxxx-home-Tenant-Id",
    "id": "xxxxx-subscription-id",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Subscription-Name",
    "state": "Enabled",
    "tenantId": "xxxxxx-TenantId",
    "user": {
      "name": "your-username@domain.com",
      "type": "user"
    }
  }
]
```
2. Once you have chosen the account subscription ID, set the account with the Azure CLI.
```Azure
az account set --subscription "xxxxx-subscription-id"
```

3. Create a Service Principal
```Azure
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
# output
Creating 'Contributor' role assignment under scope '/subscriptions/35akss-subscription-id'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
  "displayName": "azure-cli-2022-xxxx",
  "password": "xxxxxx~xxxxxx~xxxxx",
  "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
}
```
4. Set your environment variables
```powershell
$Env:ARM_CLIENT_ID = "<APPID_VALUE>"
$Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"
$Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"
$Env:ARM_TENANT_ID = "<TENANT_VALUE>"
```

## Simple Terraform Example

1. **Create a new file called main.tf and paste the configuration below.**

```terraform 
# Configure the Azure provider.
# The terraform section specifies the general configuration of Terraform.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}
# The "azurerm" provider section configures the Azure provider.
provider "azurerm" {
  features {}
}

# azurerm_resource_group is the resource type, and "rg" is the local name of the resource to be used in the rest of the code.
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}
```
2. **Initialize your Terraform configuration**

The terraform commands will work with any operating system.
```terraform
terraform init
# output 
Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.0.2"...
- Installing hashicorp/azurerm v3.0.2...
- Installed hashicorp/azurerm v3.0.2 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
3. **Format and validate the configuration**
* The **`terraform fmt`** command is a handy tool for maintaining style consistency in your Terraform code. Its regular use helps to `improve code readability` and `facilitate collaboration` within a team working on Terraform configurations.
```terraform
terraform fmt
```
* **`terraform validate`** is a useful command for checking the syntax and structure of your Terraform code before deploying, helping to avoid costly errors when running **`terraform apply`**.
```terraform
terraform validate
# Success! The configuration is valid.
```
4. **Apply your Terraform Configuration**
```terraform
terraform apply
# output 
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

   azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "westus2"
      + name     = "myTFResourceGroup"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
azurerm_resource_group.rg: Creating...
azurerm_resource_group.rg: Creation complete after 1s [id=/subscriptions/c9ed8610-47a3-4107-a2b2-a322114dfb29/resourceGroups/myTFResourceGroup]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
5. **Inspect your state**
* The **`terraform show`** command is used to display the current status of the infrastructure managed by Terraform
```terraform
terraform show
#  azurerm_resource_group.rg:
resource "azurerm_resource_group" "rg" {
    id       = "/subscriptions/c9ed8610-47a3-4107-a2b2-a322114dfb29/resourceGroups/myTFResourceGroup"
    location = "westus2"
    name     = "myTFResourceGroup"
}
```
* The **`terraform state`** list command is used to list all the resources currently managed by Terraform.
```terraform
 terraform state list
```