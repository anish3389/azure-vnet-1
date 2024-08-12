resource "azurerm_network_interface" "public" {
  name                = "anish_vnet_public_nic"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  ip_configuration {
    name                          = "public_ip_config"
    subnet_id                     = azurerm_subnet.prod_subnet_public[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_ip.id
  }

  tags = var.default_tags
}

resource "azurerm_network_interface" "private" {
  name                = "anish_vnet_private_nic"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  ip_configuration {
    name                          = "private_ip_config"
    subnet_id                     = azurerm_subnet.prod_subnet_private[0].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.default_tags
}