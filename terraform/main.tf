# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.82.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  skip_provider_registration = true 
  features {}
}

# Create a storage account
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "mystorantq234524524"
  resource_group_name      = "matthijs_sliggers-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a virtual network
resource "azurerm_virtual_network" "my_virtual_network" {
  name                = "myVirtualNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  resource_group_name = "matthijs_sliggers-rg"
}

# Create a subnet
resource "azurerm_subnet" "my_subnet" {
  name                 = "mySubnet"
  resource_group_name  = "matthijs_sliggers-rg"
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create an AKS cluster
#resource "azurerm_kubernetes_cluster" "my_aks_cluster" {
 # name                = "myAKSCluster"
  #location            = "West Europe"
  #resource_group_name = "matthijs_sliggers-rg"
  #dns_prefix          = "myaksdns"

  #default_node_pool {
    #name       = "default"
    #node_count = 1
    #vm_size    = "Standard_DS2_v2"
  #}

  #service_principal {
    #client_id = "52cc5536-a316-466c-8bf4-3868efbe0811"
    #client_secret = "ENH8Q~oAYL06mTDNbXiMmFUeM9VQdhPOr3Rqjbk-"
  #}

  #network_profile {
    #network_plugin = "azure"  
  #}
#}
