#terraform {
#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = "=3.0.0"
#    }
#  }
#}
#
## Configure the Microsoft Azure Provider
#provider "azurerm" {
#  skip_provider_registration = true
#  features {}
#}



resource "azurerm_mysql_server" "mysqlforjava" {
  name                = "artimysqljava"
  location            = "eastus"
  resource_group_name = "docker-group"

  administrator_login          = "arti"
  administrator_login_password = "A@Rt1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}

resource "azurerm_mysql_database" "mysqlforjava" {
  name                = "artiuser"
  resource_group_name = "docker-group"
  server_name         = azurerm_mysql_server.mysqlforjava.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

}

resource "azurerm_mysql_firewall_rule" "mysqlforjava" {
  name                = "AllowAzure"
  resource_group_name = "docker-group"
  server_name         = azurerm_mysql_server.mysqlforjava.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
