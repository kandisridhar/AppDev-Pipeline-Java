
resource "azurerm_container_registry" "main" {
  name                = "articontainer01"
  resource_group_name = "ranjith"
  location            = "East US"
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "West US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
 
}
