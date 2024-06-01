terraform {
  backend "azurerm" {
    resource_group_name  = "servicecom"
    storage_account_name = "servicecom"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
