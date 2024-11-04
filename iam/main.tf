terraform{

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = "<YOUR_TENANT_ID>" # Replace with your actual tenant ID
}

# Create a Resource Group for Scope of Role Assignment
resource "azurerm_resource_group" "example" {
  name     = "standard-user-resources"
  location = "East US"
}

# Create an Azure AD User
resource "azuread_user" "standard_user" {
  user_principal_name = "standarduser@a2zcybersecgmail.onmicrosoft.com"
  display_name        = "Standard User"
  mail_nickname       = "standarduser"
  password            = "YourSecurePasswordHere" # For production, use a secure method
}

# Assign Reader Role to the User on the Resource Group Scope
resource "azurerm_role_assignment" "reader_role_assignment" {
  principal_id         = azuread_user.standard_user.object_id
  role_definition_name = "Reader" # Assigns Reader role for view-only access
  scope                = azurerm_resource_group.example.id
}
}
