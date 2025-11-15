output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "app_service_plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_service_plan.app_service_plan.id
}

output "web_app_id" {
  description = "ID of the Web App"
  value       = azurerm_linux_web_app.app.id
}

output "web_app_name" {
  description = "Name of the Web App"
  value       = azurerm_linux_web_app.app.name
}

output "web_app_default_hostname" {
  description = "Default hostname of the Web App"
  value       = azurerm_linux_web_app.app.default_hostname
}

output "web_app_url" {
  description = "URL of the deployed Web App"
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = azurerm_storage_account.storage.id
}
