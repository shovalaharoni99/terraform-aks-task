terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  
  features {}  # This block is required and can be left empty

  subscription_id = "af2b00b0-f252-4e56-962d-45d1d7653003"
}




