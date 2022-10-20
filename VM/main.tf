resource "azurerm_resource_group" "vm_rg" {
  name     = "vm_rg"
  location = "West Europe"
}

resource "azurerm_container_group" "vm_container_group" {
  name                = "weatherapi"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  
  ip_address_type     = "Public"
  dns_name_label      = "aci-label-weatherapi-dapo"
  os_type             = "Linux"

  container {
    name   = "weatherapi"
    image  = "devdapo/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}