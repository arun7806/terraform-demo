terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name = "arun-rg"
  location = "Southeast Asia"
}
resource "azurerm_resource_group" "rg1" {
  name = "aswin"
  location = "Southeast Asia"
}