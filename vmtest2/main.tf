terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "41e50375-b926-4bc4-9045-348f359cf721"
  features {}
  }

  resources "azurerm_resource_group" "terrarg" {
    name = "matthijs_sliggers-rg"
    location = "West Europe"
  }