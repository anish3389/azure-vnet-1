resource "azurerm_route_table" "prod_route_table" {
  name                = "prod-routetable"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  route {
    name                   = "internet_route"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
  }
}

resource "azurerm_subnet_route_table_association" "subnet_routetable_dev_public" {
  count = length(azurerm_subnet.prod_subnet_private)
  subnet_id      = azurerm_subnet.prod_subnet_private[count.index].id
  route_table_id = azurerm_route_table.prod_route_table.id
}
