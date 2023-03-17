variable "name" {
  description = "The name of the Lighthouse Definition."
  type        = string
}

variable "managing_tenant_id" {
  description = "The ID of the managing Tenant."
  type        = string
}

variable "managed_subscription_id" {
  description = "The ID of the managed Subscription that will contains the Lighthouse Definition. (Recommended to use Management or Shared-Services Subscription in a Landing Zone context.)"
  type        = string
}

variable "description" {
  description = "A description of the Lighthouse Definition."
  type        = string
  default     = null
}

variable "authorizations" {
  description = "List of Authorization objects."
  type = list(object({
    principal_id         = string
    principal_name       = string
    role_name            = string
    delegated_role_names = optional(list(string))
  }))
}

variable "scopes" {
  description = "Map of 'name => Scope IDs' to associate the Lighthouse definition (Subscription ID or Resource Group ID)."
  type        = map(string)
}
