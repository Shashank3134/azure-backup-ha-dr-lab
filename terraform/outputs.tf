output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}
output "load_balancer_public_ip" {
  description = "HTTP frontend IP; HTTPS is not configured in this starter."
  value       = azurerm_public_ip.lb.ip_address
}
output "vm_names" {
  value = azurerm_linux_virtual_machine.web[*].name
}
output "vnet_name" {
  value = azurerm_virtual_network.lab.name
}
