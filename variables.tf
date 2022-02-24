# ---------------------------------------------------------------------------------------------------------------------
# CIDR
# ---------------------------------------------------------------------------------------------------------------------
variable "global_supernet" {
  type    = string
  default = "10.0.0.0/8"
}

# Subnetting
locals {
  azure_supernet = cidrsubnet(var.global_supernet, 8, 2) # 10.2.0.0/16
}

# ---------------------------------------------------------------------------------------------------------------------
# CSP Accounts
# ---------------------------------------------------------------------------------------------------------------------
variable "azure_account" {
  type        = string
  description = "Azure access account"
}

# ---------------------------------------------------------------------------------------------------------------------
# CSP Regions
# ---------------------------------------------------------------------------------------------------------------------
variable "azure_region" {
  type        = string
  default     = "Australia East"
  description = "Azure region"
}

# ---------------------------------------------------------------------------------------------------------------------
# Aviatrix Transit & Spoke Gateway Size
# ---------------------------------------------------------------------------------------------------------------------
variable "azure_instance_size" {
  type        = string
  default     = "Standard_B1ms" #hpe "Standard_D3_v2"
  description = "Azure gateway instance size"
}

# ---------------------------------------------------------------------------------------------------------------------
# Aviatrix Gateway Options
# ---------------------------------------------------------------------------------------------------------------------
variable "hpe" {
  type        = bool
  default     = false
  description = "Insane mode"
}

variable "ha_gw" {
  type        = bool
  default     = true
  description = "Enable HA gateway"
}

variable "enable_segmentation" {
  type        = bool
  default     = false
  description = "Enable segmentation"
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure VM Options
# ---------------------------------------------------------------------------------------------------------------------
variable "vm_admin_password" {
  type        = string
  default     = "Aviatrix123#"
  description = "VM admin password"
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure Bastion Options
# ---------------------------------------------------------------------------------------------------------------------
variable "bastion_vnet" {
  type        = string
  default     = "ManagementVNet"
  description = "Bastion VNet name"
}

variable "bastion_rg" {
  type        = string
  default     = "ManagementServices"
  description = "Bastion VNet Resource Group name"
}