terraform {


  backend "artifactory" {
    url      = "http://localhost:8081/repository/" 
    repo     = "terraform" 
    subpath  = "java"
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

module "webapp" {
  source    = "./modules/webapp"
  
}

module "mysql" {
  source    = "./modules/mysql"
  
}
