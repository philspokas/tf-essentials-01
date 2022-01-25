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
#  subscription_id = "e58fc1ee-ddc9-418f-9d25-0dd1879357ff"
}

resource "azurerm_resource_group" "tf-essential-01" {
  name     = var.resourcegroup_name
  location = "westus2"
}

