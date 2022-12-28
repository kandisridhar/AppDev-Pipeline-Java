resource "azurerm_resource_group" "main" {
  name     = "ranjith"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "arti-container"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
