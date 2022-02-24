# Aviatrix Azure Transit Firenet Demo

This repository provides a Terraform implementation that deploys a single region Aviatrix Multi-Cloud Networking Architecture with FireNet using Aviatrix modules in Azure.
Deploys Windows test VMs with Firewall disabled in Azure with Bastion, allow inbound from RFC1918.

The code provided is for demo purposes only.

![Aviatrix Azure Transit Firenet Demo](images/avx-azure-firenet-demo.png "Aviatrix Aviatrix Azure Transit Firenet Demo")

## Prerequisites

Please make sure you have:
- Aviatrix Controller 6.6
- Azure access accounts are onboarded. 

## Environment Variables

To run this project, you will need to set the following environment variables

Variables | Description
--- | ---
AVIATRIX_CONTROLLER_IP | Aviatrix Controller IP or FQDN 
AVIATRIX_USERNAME | Aviatrix Controller Username
AVIATRIX_PASSWORD | Aviatrix Controller Password
TF_VAR_azure_account | Azure Aviatrix Account
ARM_SUBSCRIPTION_ID | Azure Subscription ID
ARM_TENANT_ID | Azure Tenant ID
ARM_CLIENT_ID | Azure Client ID
ARM_CLIENT_SECRET | Azure Client Secret

## Run Locally

Clone the project

```bash
git clone https://github.com/bayupw/avx-azure-firenet-demo.git
```

Go to the project directory

```bash
cd avx-azure-firenet-demo
```

Set environment variables

```bash
export AVIATRIX_CONTROLLER_IP="aviatrixcontroller.aviatrix.lab"
export AVIATRIX_USERNAME="admin"
export AVIATRIX_PASSWORD="aviatrix123"
export TF_VAR_aws_account="AWS-Aviatrix-Account"
export TF_VAR_azure_account="Azure-Aviatrix-Account"
export TF_VAR_gcp_account="GCP-Aviatrix-Account"
export AWS_ACCESS_KEY_ID="A1b2C3d4E5"
export AWS_SECRET_ACCESS_KEY="A1b2C3d4E5"
export AWS_DEFAULT_REGION="ap-southeast-2"
export ARM_SUBSCRIPTION_ID="aaaa-1111-bbbb-2222-cccc-3333"
export ARM_TENANT_ID="aaaa-1111-bbbb-2222-cccc-3333"
export ARM_CLIENT_ID="aaaa-1111-bbbb-2222-cccc-3333"
export ARM_CLIENT_SECRET="A1b2C3d4E5"
```

Terraform workflow

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## Inputs

| Name | Description | Default | Required |
|------|-------------|---------|----------|
| azure_account | Azure Account for Aviatrix Controller | `null` | yes |
| azure_region | Azure Region | `Australia East` | no |
| azure_instance_size | Azure gateway instance size | `Standard_B1ms` | no |
| hpe | Insane mode flag | `false` | no |
| ha_gw | Enable HA gateway | `true` | no |
| enable_segmentation | Enable segmentation | `false` | no |
| vm_admin_password | AWS EC2 & Azure VM password | `Aviatrix123#` | no |
| bastion_vnet | Bastion VNet name | `ManagementVNet` | no |
| bastion_rg | Bastion VNet Resource Group name | `ManagementServices` | no |