variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-tictactoe"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "tictactoe-app"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "app_service_plan_sku" {
  description = "App Service Plan SKU (Free, B1, B2, etc.)"
  type        = string
  default     = "B1"
}

variable "python_version" {
  description = "Python version for App Service"
  type        = string
  default     = "3.9"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project     = "TicTacToe"
    Environment = "dev"
    CreatedBy   = "Terraform"
  }
}
