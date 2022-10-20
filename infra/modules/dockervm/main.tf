variable "prefix" {
  default = "docker"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "docker-group"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "docker-group"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.prefix}_public_ip"
  resource_group_name = "docker-group"
  location            = "eastus"
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = "eastus"
  resource_group_name = "docker-group"

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
	public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-nsg"
  location            = "eastus"
  resource_group_name = "docker-group"

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-java-vm"
  location              = "eastus"
  resource_group_name   = "docker-group"
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"
  delete_os_disk_on_termination = "true"

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true
  
  plan {
    name      = "ubuntu1804lts-python-docker-zerto"
    publisher = "zerto"
    product   = "azure-vms-by-zerto"
  }

  storage_image_reference {
    publisher = "zerto"
    offer     = "azure-vms-by-zerto"
    sku       = "ubuntu1804lts-python-docker-zerto"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-machine"
    admin_username = "docker"
    #admin_password = "Credshel@240597"
  }
  admin_ssh_key {
   username = "azureuser"
   public_key = "---- BEGIN SSH2 PUBLIC KEY ----
Comment: "rsa-key-20221020"
AAAAB3NzaC1yc2EAAAADAQABAAABAQDWt8Ndjt/ygzduF2Ii+AVnU1Q0NerxtUQZ
IdAJL81C+Hl3z31MEE3erCB/G+vKl4GhlpIvcVZBELxBRWD4emqMxW2qSZqCaNH6
ChD+dONBWGmNG7iJSQMfWLVyYcAsB57WxxotFNKUmF3gH7aydJ5WJvWezonPVgCY
/NBnDvW/6UYJzKiQJcm3S38flsU4gpNdwktw6uUAd4wDnneyWsIW/e25nuYUGUHe
mJa/F0DmEcfYvFEumK9ykulNYv3DroS9eSJNMHOFb3V9blMhx1oLOCwIC+jJuYCY
ClnXHcT7Ej1wG6AEi92XKvhhMqjc+9NtlyW3wuISa5Aa7H4X+VSn
---- END SSH2 PUBLIC KEY ----"
}
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}


