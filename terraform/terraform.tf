terraform {
  required_version = ">= 1.5.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.41.0"
    }
  }
}

provider "azurerm" {
  features {}
}