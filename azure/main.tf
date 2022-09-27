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

resource "azurerm_resource_group" "tf_essential_01" {
  name     = var.resourcegroup_name
  location = "westus2"
}

resource "azurerm_storage_account" "tf_essential_sa" {
  name                     = "tfessential01"
  resource_group_name      = azurerm_resource_group.tf_essential_01.name
  location                 = azurerm_resource_group.tf_essential_01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tf_essential_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_essential_sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "the_blob" {
  name                   = "terraform-this.jpg"
  storage_account_name   = azurerm_storage_account.tf_essential_sa.name
  storage_container_name = azurerm_storage_container.tf_essential_container.name
  type                   = "Block"
  source                 = "C:\\temp\\terraform_this.jpg"
}

