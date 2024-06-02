

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
  ssh_adress_prefixes = var.ssh_adress_prefixes
}

module "storage" {
  source                 = "./modules/storage"
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  storage_account_name   = var.storage_account_name
  tfstate_container_name = var.tfstate_container_name
  assets_container_name  = var.assets_container_name
  subnet_id              = module.network.subnet_id
}

module "virtual_machine" {
  source               = "./modules/virtual_machine"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  network_interface_id = module.network.network_interface_id
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  vm_disk_name         = var.vm_disk_name
  vm_profile           = var.vm_profile
  admin_username       = var.admin_username
  admin_password       = var.admin_password
}