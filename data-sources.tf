data "azurerm_role_definition" "builtin_role" {
  for_each = toset([for a in var.authorizations : a.role_name])

  name = each.value
}

data "azurerm_role_definition" "builtin_role_delegated" {
  for_each = toset(distinct(compact(flatten([for a in var.authorizations : a.delegated_role_names if a.delegated_role_names != null]))))

  name = each.value
}
