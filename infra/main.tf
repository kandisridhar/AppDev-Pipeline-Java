terraform {
  
   backend "artifactory" {
    url      = "http://20.197.58.214:8081/repository/" 
    repo     = "terraform" 
    subpath  = "dockerjava"
    username = "admin" 
    password = "admin" 
  }
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

module "dockervm" {
  source    = "./modules/dockervm"
}

module "mysql" {
  source    = "./modules/mysql"  
}
