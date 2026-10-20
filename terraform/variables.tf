variable "location" {
  description = "Primary Azure region; verify zone and SKU support before deployment."
  type        = string
  default     = "Central India"
}
variable "resource_prefix" {
  description = "Short prefix for lab resource names."
  type        = string
  default     = "azresilience-lab"
}
variable "admin_username" {
  description = "Linux administrator username."
  type        = string
  default     = "azurelabadmin"
}
variable "ssh_public_key" {
  description = "Contents of your SSH public key; never provide a private key."
  type        = string
  sensitive   = true
}
variable "vm_size" {
  description = "Choose a size available in your region and subscription."
  type        = string
  default     = "Standard_B2s"
}
variable "zones" {
  description = "Zones for the two VMs. Change/remove if unsupported for selected region/SKU."
  type        = list(string)
  default     = ["1", "2"]
}
