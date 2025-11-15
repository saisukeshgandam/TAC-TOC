resource_group_name     = "rg-tictactoe"
location                = "East US"
app_name                = "tictactoe-app"
environment             = "dev"
app_service_plan_sku    = "B1"
python_version          = "3.9"

tags = {
  Project     = "TicTacToe"
  Environment = "dev"
  CreatedBy   = "Terraform"
  ManagedBy   = "Terraform"
}
