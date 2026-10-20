# Terraform Starter

## Resources
- Resource group
- VNet and web subnet
- NSG allowing HTTP for this lab
- Two Ubuntu Linux VMs using SSH public-key authentication
- Standard public Load Balancer with backend pool and TCP health probe
- Cloud-init to install Nginx and display each VM hostname

## Before running
1. Verify region support for Ubuntu image, VM size, and availability zones.
2. Edit variables or use a local `terraform.tfvars` file (do not commit secrets).
3. Provide your SSH public key only; never provide a private key.
4. Review `main.tf`, zone/SKU settings, and the complete Terraform plan.
5. Run `terraform plan` before applying.

This starter provisions the HA web tier only. Azure Backup and Site Recovery are separate implementation stages that require region-specific choices and explicit validation of supported vault/replication configuration.
