# ---------------------------------------------------------------------------------------------------------------------
# Azure Spoke 2
# ---------------------------------------------------------------------------------------------------------------------
module "azure_spoke_2" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "azure"
  name          = "spoke-2"
  cidr          = cidrsubnet(local.azure_supernet, 8, 3)
  region        = var.azure_region
  account       = var.azure_account
  transit_gw    = module.azure_transit_firenet_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.azure_instance_size
  ha_gw         = var.ha_gw
}