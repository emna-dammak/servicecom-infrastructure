terraform {
  backend "azurerm" {
    resource_group_name  = "automation"
    storage_account_name = "tfstatesac"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
