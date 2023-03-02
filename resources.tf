data "azurerm_role_definition" "builtin_role" {
  for_each = toset([for a in var.authorizations : a.role_name])

  name = each.value
}

data "azurerm_role_definition" "builtin_role_delegated" {
  for_each = toset(distinct(compact(flatten([for a in var.authorizations : a.delegated_role_names if a.delegated_role_names != null]))))

  name = each.value
}

resource "azurerm_lighthouse_definition" "lighthouse_def" {
  name               = var.name
  description        = var.description
  managing_tenant_id = var.managing_tenant_id
  scope              = var.managed_subscription_id

  dynamic "authorization" {
    for_each = toset(var.authorizations)

    content {
      principal_id           = authorization.value.principal_id
      principal_display_name = authorization.value.principal_name
      # related issue: https://github.com/terraform-providers/terraform-provider-azurerm/issues/11172
      role_definition_id = replace(lower(data.azurerm_role_definition.builtin_role[authorization.value.role_name].id), lower("//providers/Microsoft.Authorization/roleDefinitions//"), "")

      # https://learn.microsoft.com/en-us/azure/lighthouse/how-to/deploy-policy-remediation#create-a-user-who-can-assign-roles-to-a-managed-identity-in-the-customer-tenant
      delegated_role_definition_ids = authorization.value.delegated_role_names != null ? [
        for role in authorization.value.delegated_role_names :
        replace(lower(data.azurerm_role_definition.builtin_role_delegated[role].id), lower("//providers/Microsoft.Authorization/roleDefinitions//"), "")
      ] : null
    }
  }

  lifecycle {
    precondition {
      condition     = alltrue([for a in var.authorizations : a.delegated_role_names == null || (try(length(a.delegated_role_names), 0) > 0 && a.role_name == "User Access Administrator")])
      error_message = "`delegated_role_names` attribute must be set and can be set only with `role_name` set to 'User Access Administrator'."
    }
  }
}

resource "azurerm_lighthouse_assignment" "lighthouse_assign" {
  for_each = var.scopes

  scope                    = each.value
  lighthouse_definition_id = azurerm_lighthouse_definition.lighthouse_def.id
}
