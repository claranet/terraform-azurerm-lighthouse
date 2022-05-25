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
  ]

  scopes = {
    "Production Subscription" = local.subscription_id
  }
}
