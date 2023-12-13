terraform {
  required_version = ">= 1.3.0, <2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate-mgmt"
    storage_account_name = "rptfstate"
    container_name       = "states"
    key                  = "template.tfstate"
  }
}

provider "azurerm" {
  features {}
}
