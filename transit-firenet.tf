# ---------------------------------------------------------------------------------------------------------------------
# Azure Transit
# ---------------------------------------------------------------------------------------------------------------------
module "azure_transit_firenet_1" {
  source                 = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version                = "v5.0.1"
  cidr                   = cidrsubnet(local.azure_supernet, 7, 0)
  region                 = var.azure_region
  account                = var.azure_account
  firewall_image         = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
  firewall_image_version = "9.1.0"
}