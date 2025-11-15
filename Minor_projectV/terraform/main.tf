resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_name}-asp-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku

  tags = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.app_name}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on                = var.app_service_plan_sku != "Free" ? true : false
    container_registry_use_managed_identity = false

    application_stack {
      python_version = var.python_version
    }

    app_command_line = "python -m gunicorn --bind=0.0.0.0:8000 --workers=2 app:app"
  }

  app_settings = {
    "FLASK_ENV"             = "production"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  tags = var.tags
}

resource "azurerm_app_service_source_control" "app_source_control" {
  app_id            = azurerm_linux_web_app.app.id
  repo_url          = "https://github.com/saisukeshgandam/TAC-TOC.git"
  branch            = "main"
  use_manual_integration = true
}

resource "azurerm_storage_account" "storage" {
  name                     = replace(lower("${var.app_name}${var.environment}"), "-", "")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
