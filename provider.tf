
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  backend "azurerm" {
    use_azuread_auth = true
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  use_oidc = true
}