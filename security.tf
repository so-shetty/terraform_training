/*data "akamai_appsec_configuration" "my-configurations" {
}

output "configuration-list" {
    value = data.akamai_appsec_configuration.my-configurations.output_text
}

*/



output "sowaf" {
  value = data.akamai_appsec_configuration.soshetty_security_configuration_data
}

data "akamai_property" "soshetty_prop" {
  name = "testing.soshetty.com_pm"
}

output "groupid" {
    value = data.akamai_property.soshetty_prop.group_id
  
}

output "contractid" {
    value = data.akamai_property.soshetty_prop.contract_id
  
}

resource "akamai_appsec_configuration" "soshetty_security_configuration" {
 name        = "Soshetty WA1"
 description = "This is my new configuration for terraform Cohort"
 contract_id = replace((data.akamai_property.soshetty_prop.contract_id),"ctr_","")
 group_id    = tonumber(replace((data.akamai_property.soshetty_prop.group_id),"grp_",""))
 host_names  = ["testing.soshetty.com"]
 create_from_config_id = "119799"
 create_from_version = 1
}

data "akamai_appsec_configuration" "soshetty_security_configuration_data" {
    name = "Soshetty WA1"
}

resource "akamai_appsec_security_policy" "mysecpolicy" {
    config_id = data.akamai_appsec_configuration.soshetty_security_configuration_data.config_id
    security_policy_name = "newpolicy1"
    security_policy_prefix = "5464"
  
}

data "akamai_appsec_security_policy" "appsecdata" {
    security_policy_name = "newpolicy1"
    config_id = data.akamai_appsec_configuration.soshetty_security_configuration_data.config_id
}

resource "akamai_appsec_security_policy" "newsecpolicy" {
    create_from_security_policy_id = data.akamai_appsec_security_policy.appsecdata.security_policy_id
  config_id = data.akamai_appsec_configuration.soshetty_security_configuration_data.config_id
  security_policy_name = "wafpolicy2"
  security_policy_prefix = "6568"

}

/* data "akamai_appsec_configuration" "soshetty_security_configuration_data" {
    name = "Soshetty security configuration"
}

resource "akamai_appsec_security_policy" "soshetty_appsec_security_policy" {
  config_id              = data.akamai_appsec_configuration.soshetty_security_configuration_data.config_id
  security_policy_name   = "New firewall policy"
  security_policy_prefix = "waf1"
}*/