# Create a public IP
resource "azurerm_public_ip" "app_gateway_pip" {
  name                = "pip-${var.app_gateway_pip}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}
# Create the Application Gateway
resource "azurerm_application_gateway" "app_gateway" {
  name                = "${var.app_gateway_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku {
    name     = "${var.app_gateway_sku_name}"
    tier     = "${var.app_gateway_sku_tier}"
    capacity = 2
  }
  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.subnet_name.id
  }
  frontend_port {
    name = "my-frontend-port"
    port = 80
  }
  frontend_ip_configuration {
    name                 = "my-frontend-ip-configuration"
    public_ip_address_id = azurerm_public_ip.app_gateway_pip.id
  }
firewall_policy_id = azurerm_web_application_firewall_policy.waf.id

  backend_address_pool {
    name = "my-backend-address-pool"
  }
  backend_http_settings {
    name                  = "my-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }
  http_listener {
    name                           = "my-http-listener"
    frontend_ip_configuration_name = "my-frontend-ip-configuration"
    frontend_port_name             = "my-frontend-port"
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = "my-request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "my-http-listener"
    backend_address_pool_name  = "my-backend-address-pool"
    backend_http_settings_name = "my-backend-http-settings"
  }
}