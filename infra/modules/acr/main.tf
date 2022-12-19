resource "azurerm_resource_group" "main" {
  name     = "ranjith"
  location = "East US"
}

resource "azurerm_container_registry" "main" {
  name                = "articontainer01"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
 
}
