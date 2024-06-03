resource "azurerm_virtual_network" "servicecom_vn" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "servicecom_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.servicecom_vn.name
  address_prefixes     = var.subnet_prefix

  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_network_security_group" "servicecom_nsg" {
  name                = "servicecom_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow-ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefixes     = var.ssh_adress_prefixes
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.servicecom_nsg.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "http" {
  name                        = "allow-http"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.servicecom_nsg.name
  resource_group_name = var.resource_group_name

}

resource "azurerm_network_security_rule" "grafana" {
  name                        = "allow-grafana"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3001"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.servicecom_nsg.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "servicecom-pub-ip" {
  name                = "servicecom-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "servicecom_nic" {
  name                = "servicecom_nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.servicecom_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.servicecom-pub-ip.id
  }
}
