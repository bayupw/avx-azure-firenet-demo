# ---------------------------------------------------------------------------------------------------------------------
# Azure Spoke
# ---------------------------------------------------------------------------------------------------------------------
module "azure_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "azure"
  name          = "spoke-1"
  cidr          = cidrsubnet(local.azure_supernet, 8, 2)
  region        = var.azure_region
  account       = var.azure_account
  transit_gw    = module.azure_transit_firenet_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.azure_instance_size
  ha_gw         = var.ha_gw
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure VM
# ---------------------------------------------------------------------------------------------------------------------
module "azure_spoke_1_vm" {
  source              = "Azure/compute/azurerm"
  resource_group_name = module.azure_spoke_1.vpc.resource_group
  is_windows_image    = true
  vm_hostname         = "vm-spoke1" // line can be removed if only one VM module per resource group
  admin_password      = var.vm_admin_password
  vm_os_simple        = "WindowsServer"
  nb_public_ip        = 0 # do not assign public IP, set to 1 to assign public IP
  vnet_subnet_id      = module.azure_spoke_1.vpc.private_subnets[0].subnet_id
  vm_size             = "Standard_B1ms"
}

resource "azurerm_virtual_machine_extension" "disable_fw" {
  name                 = "disable-win-fw"
  virtual_machine_id   = module.azure_spoke_1_vm.vm_ids[0]
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  protected_settings = <<SETTINGS
  {
     "commandToExecute": "powershell -encodedCommand ${textencodebase64(file("disable-win-fw.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}