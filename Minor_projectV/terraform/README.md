# Terraform Configuration for Tic Tac Toe Flask App

This directory contains Terraform code to deploy the Flask Tic Tac Toe application to Azure.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- Azure subscription with appropriate permissions

## Files

- `terraform.tf` - Provider configuration and backend setup
- `main.tf` - Azure resources (Resource Group, App Service Plan, Web App, Storage Account)
- `variables.tf` - Input variables
- `outputs.tf` - Output values (Web App URL, IDs, etc.)
- `terraform.tfvars` - Default variable values

## Deployed Resources

- **Resource Group** - Container for all resources
- **App Service Plan** - Hosting plan (Linux, configurable SKU)
- **Linux Web App** - Flask application running on Python 3.9
- **Storage Account** - For app storage needs
- **Source Control Integration** - Auto-deployment from GitHub (main branch)

## Quick Start

1. **Initialize Terraform:**
   ```bash
   cd terraform
   terraform init
   ```

2. **Review the plan:**
   ```bash
   terraform plan
   ```

3. **Deploy:**
   ```bash
   terraform apply
   ```

4. **Get the Web App URL:**
   ```bash
   terraform output web_app_url
   ```

## Configuration

Edit `terraform.tfvars` to customize:
- `resource_group_name` - Name of the resource group
- `location` - Azure region (e.g., "East US")
- `app_name` - Base name for resources
- `environment` - Environment name (dev, staging, prod)
- `app_service_plan_sku` - SKU tier (Free, B1, B2, S1, etc.)
- `python_version` - Python version (3.8, 3.9, 3.10, etc.)

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## GitHub Integration

The Terraform config automatically sets up source control integration to deploy from the main branch:
- Repository: https://github.com/saisukeshgandam/TAC-TOC.git
- Branch: main

When you push code to the main branch, the App Service will automatically deploy the latest version.

## Notes

- The Web App runs Flask with Gunicorn as the application server
- `always_on` is enabled for non-Free tier SKUs to prevent cold starts
- Use `B1` or higher SKU for production workloads
- Free tier has limitations on resources and uptime SLA
