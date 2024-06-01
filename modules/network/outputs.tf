output "subnet_id" {
  value = azurerm_subnet.servicecom_subnet.id
}

output "network_interface_id" {
  value = azurerm_network_interface.servicecom_nic.id
}

output "servicecom_public_ip" {
  value = azurerm_public_ip.servicecom-pub-ip 
}