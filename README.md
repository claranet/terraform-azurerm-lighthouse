# Azure Lighthouse
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/lighthouse/azurerm/)

Azure terraform module to create a Lighthouse definition and assign it to scopes where management delegation is needed.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
locals {
  claranet_tenant_id = "00000000-0000-0000-0000-000000000000"
  subscription_id    = "/subscriptions/${var.azure_subscription_id}"
}

module "msp" {
  source  = "claranet/lighthouse/azurerm"
  version = "x.x.x"

  name                    = "Claranet MSP"
  description             = "Lighthouse delegation to let Claranet manage resources."
  managing_tenant_id      = local.claranet_tenant_id
  managed_subscription_id = local.subscription_id

  authorizations = [
    {
      principal_id   = "00000000-0000-0000-0000-000000000000"
      principal_name = "L1 Claranet CORE Team"
      role_name      = "Contributor"
    },
    {
      principal_id   = "00000000-0000-0000-0000-000000000000"
      principal_name = "L2 Claranet OnCall Build Team"
      role_name      = "Contributor"
    },
    {
      principal_id   = "00000000-0000-0000-0000-000000000000"
      principal_name = "Claranet SDM"
      role_name      = "Reader"
    },
    {
      principal_id   = "00000000-0000-0000-0000-000000000000"
      principal_name = "MSI Admin"
      # https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
      role_name            = "User Access Administrator"
      delegated_role_names = ["Contributor", "AcrPull", "AcrPush"]
    },
  ]

  scopes = {
    "Production Subscription" = local.subscription_id
  }
}
```

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lighthouse_assignment.lighthouse_assign](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lighthouse_assignment) | resource |
| [azurerm_lighthouse_definition.lighthouse_def](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lighthouse_definition) | resource |
| [azurerm_role_definition.builtin_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) | data source |
| [azurerm_role_definition.builtin_role_delegated](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authorizations | List of Authorization objects. | <pre>list(object({<br/>    principal_id         = string<br/>    principal_name       = string<br/>    role_name            = string<br/>    delegated_role_names = optional(list(string))<br/>  }))</pre> | n/a | yes |
| description | A description of the Lighthouse Definition. | `string` | `null` | no |
| managed\_subscription\_id | The ID of the managed Subscription that will contains the Lighthouse Definition. (Recommended to use Management or Shared-Services Subscription in a Landing Zone context.) | `string` | n/a | yes |
| managing\_tenant\_id | The ID of the managing Tenant. | `string` | n/a | yes |
| name | The name of the Lighthouse Definition. | `string` | n/a | yes |
| scopes | Map of 'name => Scope IDs' to associate the Lighthouse definition (Subscription ID or Resource Group ID). | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lighthouse\_definition\_id | Lighthouse definition ID |
<!-- END_TF_DOCS -->
## Related documentation

- Microsoft Azure Lighthouse documentation: [docs.microsoft.com/en-us/azure/lighthouse](https://docs.microsoft.com/en-us/azure/lighthouse)
