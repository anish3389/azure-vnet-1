resource "azurerm_virtual_network" "vnet_dev" {
  name                = local.dev.vnet.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = local.dev.vnet.address_space

  tags = var.default_tags
}

resource "azurerm_subnet" "dev_subnet_public" {
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.dev.vnet.public_subnets)
  name                 = "${var.dev_prefix}-public-subnet${count.index}"
  address_prefixes     = local.dev.vnet.public_subnets[count.index].address_prefixes
}

resource "azurerm_subnet" "dev_subnet_private" {
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.dev.vnet.private_subnets)
  name                 = "${var.dev_prefix}-private-subnet${count.index}"
  address_prefixes     = local.dev.vnet.private_subnets[count.index].address_prefixes
}

resource "azurerm_virtual_network" "vnet_prod" {
  name                = local.prod.vnet.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = local.prod.vnet.address_space

  tags = var.default_tags
}

resource "azurerm_subnet" "prod_subnet_public" {
  virtual_network_name = azurerm_virtual_network.vnet_prod.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.prod.vnet.public_subnets)
  name                 = "${var.prod_prefix}-public-subnet${count.index}"
  address_prefixes     = local.prod.vnet.public_subnets[count.index].address_prefixes
}

resource "azurerm_subnet" "prod_subnet_private" {
  virtual_network_name = azurerm_virtual_network.vnet_prod.name
  resource_group_name  = data.azurerm_resource_group.main.name
  
  count = length(local.prod.vnet.private_subnets)
  name                 = "${var.prod_prefix}-private-subnet${count.index}"
  address_prefixes     = local.prod.vnet.private_subnets[count.index].address_prefixes
}