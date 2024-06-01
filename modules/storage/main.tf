resource "azurerm_storage_account" "servicecom_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.tfstate_container_name
  storage_account_name  = azurerm_storage_account.servicecom_storage_account.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "assets" {
  name                  = var.assets_container_name
  storage_account_name  = azurerm_storage_account.servicecom_storage_account.name
  container_access_type = "blob"
}

resource "azurerm_storage_account_network_rules" "servicecom_sa_network_rules" {
  storage_account_id = azurerm_storage_account.servicecom_storage_account.id

  default_action = "Allow"
  bypass         = ["AzureServices"]

  virtual_network_subnet_ids = [
    var.subnet_id
  ]
}
