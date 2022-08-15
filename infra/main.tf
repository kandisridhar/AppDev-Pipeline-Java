terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "vm" {
  source    = "./modules/vm"
  
}

module "mysql" {
  source    = "./modules/mysql"
  
}
  
output "public_ip" {
  value = module.vm.azurerm_public_ip.public_ip.ip_address
}
