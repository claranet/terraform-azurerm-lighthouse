output "id" {
  value       = azurerm_lighthouse_definition.main.id
  description = "Lighthouse definition ID."
}

output "resource" {
  value       = azurerm_lighthouse_definition.main
  description = "Lighthouse resource object."
  sensitive   = true
}

output "resource_assignments" {
  value       = azurerm_lighthouse_assignment.main
  sensitive   = true
  description = "Lighthouse assignment resource objects."
}
