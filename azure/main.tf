terraform {
    required_version = "=1.1.4"

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=2.93.1"
        }
        random = "=3.1.0"
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf-essential-01" {
  name     = "tf-essential-01"
  location = "westus2"
}
