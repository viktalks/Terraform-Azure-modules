# Create a Web Application Firewall (WAF) policy
resource "azurerm_web_application_firewall_policy" "waf" {
  name                = "${var.waf_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Configure the policy settings
  policy_settings {
    enabled                                   = false
    file_upload_limit_in_mb                   = 100
    js_challenge_cookie_expiration_in_minutes = 5
    max_request_body_size_in_kb               = 128
    mode                                      = var.waf_mode
    request_body_check                        = true
    request_body_inspect_limit_in_kb          = 128
  }

  # Define managed rules for the WAF policy
  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  # Define a custom rule to block traffic from a specific IP address
  custom_rules {
    name      = "BlockSpecificIP"
    priority  = 1
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }
      operator           = "IPMatch"
      negation_condition = false
      match_values       = var.blocked_ip # Replace with the IP address to block
    }

    action = "Block"
  }
}
