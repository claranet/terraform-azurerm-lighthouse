data "azurerm_role_definition" "builtin_role" {
  for_each = toset([for a in var.authorizations : a.role_name])

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
    }
  }
}

resource "azurerm_lighthouse_assignment" "lighthouse_assign" {
  for_each = var.scopes

  scope                    = each.value
  lighthouse_definition_id = azurerm_lighthouse_definition.lighthouse_def.id
}
