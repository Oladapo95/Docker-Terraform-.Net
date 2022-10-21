terraform {
    backend "azurerm" {
        resource_group_name = "logicappintro"
        storage_account_name = "storageappdapo"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}