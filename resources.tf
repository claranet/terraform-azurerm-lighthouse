data "azurerm_role_definition" "builtin_role" {
  for_each = {
    contributor = "b24988ac-6180-42a0-ab88-20f7382dd24c"
    reader      = "acdd72a7-3385-48ef-bd42-f606fba81ae7"
  }

  role_definition_id = each.value
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
      role_definition_id     = data.azurerm_role_definition.builtin_role[authorization.value.role_name].role_definition_id
    }
  }
}

resource "azurerm_lighthouse_assignment" "lighthouse_assign" {
  for_each = toset(var.scopes)

  scope                    = each.value
  lighthouse_definition_id = azurerm_lighthouse_definition.lighthouse_def.id
}
