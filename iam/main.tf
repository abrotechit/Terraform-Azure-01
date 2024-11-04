terraform{
required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1"

}

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = "ea2e0df1-ee30-4c94-9572-0afd18aeb506" # Also called Parent management group in the Azure Portal UI
}

# Create a Resource Group for Scope of Role Assignment
resource "azurerm_resource_group" "alluserg" {
  name     = "standard-user-resources"
  location = "East US"
}

# Create an Azure AD User
resource "azuread_user" "standard_user" {
  user_principal_name = "standarduser1@a2zcybersecgmail.onmicrosoft.com"
  display_name        = "Standard User"
  mail_nickname       = "standarduser"
  password            = "test123" # For production, use a secure method
}

# Assign Reader Role to the User on the Resource Group Scope
resource "azurerm_role_assignment" "reader_role_assignment" {
  principal_id         = azuread_user.standard_user.object_id
  role_definition_name = "Reader" # Assigns Reader role for view-only access
  scope                = azurerm_resource_group.alluserg.id
}

