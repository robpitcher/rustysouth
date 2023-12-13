terraform {
  required_version = ">= 1.3.0, <2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.83.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-app"
    storage_account_name = "rptfstate02"
    container_name       = "tfstates"
    key                  = "rust.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
