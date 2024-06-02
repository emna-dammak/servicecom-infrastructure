#### Main ####

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "servicecom"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "France Central"
}

#### Network ####

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "servicecom_vnet"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "servicecom_subnet_1"
}

variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "The address prefix of the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "ssh_adress_prefixes" {
  description = "The list of addresses allowed to ssh into the vm "
  type        = list(string)
  default     = ["*"]
}

#### Storage ####

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "servicecom"
}

variable "tfstate_container_name" {
  description = "The name of the tfstate blob container"
  type        = string
  default     = "tfstate"
}

variable "assets_container_name" {
  description = "The name of the assets blob container"
  type        = string
  default     = "assets"
}

#### Instance ####

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "servicecom"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_disk_name" {
  description = "The name of the virtual machine disk"
  type        = string
  default     = "servicecom_disk"
}

variable "vm_profile" {
  description = "The profile name of the virtual machine"
  type        = string
  default     = "servicecom"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "servicecom"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  default     = "Servicecom2024"
}

