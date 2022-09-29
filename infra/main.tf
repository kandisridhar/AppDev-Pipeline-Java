terraform {

   backend "artifactory" {
    url      = "http://20.124.0.240:8081/repository/" 
    repo     = "terraform" 
    subpath  = "java"
    username = "admin" 
    password = "admin" 
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
     # version = "3.23.0"
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
