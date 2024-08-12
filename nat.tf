resource "azurerm_nat_gateway" "prod_nat" {
  name                = local.prod.nat.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku_name            = "Standard"
}

resource "azurerm_subnet_nat_gateway_association" "prod_nat_subnet" {
  nat_gateway_id = azurerm_nat_gateway.prod_nat.id
  subnet_id      = azurerm_subnet.prod_subnet_private[0].id
}

resource "azurerm_nat_gateway_public_ip_association" "prod_nat_ip" {
  nat_gateway_id       = azurerm_nat_gateway.prod_nat.id
  public_ip_address_id = azurerm_public_ip.nat_ip.id
}
