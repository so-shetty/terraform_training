

resource "akamai_edge_hostname" "my_ehn" {
  contract_id   = data.akamai_appsec_contracts_groups.my_contracts_groups.contractid
  edge_hostname = "new-terraform-property.soshetty.com.edgesuite.net"
  group_id      = data.akamai_appsec_contracts_groups.my_contracts_groups.groupid
  ip_behavior   = "IPV4"
  product_id = "prd_Fresca"

}


resource "akamai_property" "new-property" {
  name        = "soshetty-new-property"
  product_id  = "prd_Fresca"
  contract_id = "ctr_1-1NC95D"
  group_id    = "grp_94456"
}

resource "akamai_property" "new-test-property" {
  name        = "soshetty-new-terraform-property"
  product_id  = "prd_Fresca"
  contract_id = "ctr_1-1NC95D"
  group_id    = "grp_94456"
  rules = file("${path.root}/property-snippets/rules.json")
  rule_format = "v2025-07-07"
  hostnames {
    cname_from             = "terraform.soshetty.com"
    cname_to               = "new-terraform-property.soshetty.com.edgesuite.net"
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "terraform2.soshetty.com"
    cname_to               = "new-terraform-property.soshetty.com.edgesuite.net"
    cert_provisioning_type = "DEFAULT"
  }
}

resource "akamai_cp_code" "my_cp_code" {
  name        = "My CP Code"
  contract_id   = data.akamai_appsec_contracts_groups.my_contracts_groups.contractid
  group_id      = data.akamai_appsec_contracts_groups.my_contracts_groups.groupid
  product_id  = "prd_Fresca"
  timeouts {
    update = "1h"
  }
}

output "my_cp_code" {
  value = akamai_cp_code.my_cp_code
}

output "ruleformat" {
    value = akamai_property.new-test-property.rule_format
  
}

data "akamai_property_rule_formats" "my_rule_formats" {
}

/*output "my_rule_formats" {
  value = data.akamai_property_rule_formats.my_rule_formats
}

/*output "my_rules" {
  value = akamai_property.new-test-property.rules
}*/
