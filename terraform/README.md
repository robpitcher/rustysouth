# Terraform Docs

We're using a github action to automatically run Terraform Docs each time a pull request is created.  This will keep our Terraform documentation up-to-date as we build out our environemnt(s).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, <2.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.83.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.83.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_policy_vm.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/backup_policy_vm) | resource |
| [azurerm_backup_protected_vm.vm1](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/backup_protected_vm) | resource |
| [azurerm_linux_virtual_machine.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_log_analytics_workspace.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/log_analytics_workspace) | resource |
| [azurerm_network_interface.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/public_ip) | resource |
| [azurerm_recovery_services_vault.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/recovery_services_vault) | resource |
| [azurerm_resource_group.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.rust](https://registry.terraform.io/providers/hashicorp/azurerm/3.83.0/docs/resources/virtual_network) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.5/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Provide a location for resources. | `string` | n/a | yes |
| <a name="input_projectName"></a> [projectName](#input\_projectName) | Provide a project name. This will be used for the base Resource Group and can be used for future resources. | `string` | n/a | yes |
<!-- END_TF_DOCS -->

# References

 * [Terraform](https://developer.hashicorp.com/terraform/intro)
 * [Terraform Docs](https://terraform-docs.io)
 * [Terraform Docs Github Action](https://github.com/terraform-docs/gh-actions)
