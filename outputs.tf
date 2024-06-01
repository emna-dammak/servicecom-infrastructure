output "public_ip" {
  value = module.network.servicecom_public_ip.ip_address
}