data "akamai_group" "test_group" {
     group_name = "Akamai Technologies - Assets-1-3CV382"
     contract_id = "ctr_1-3CV382"
}

output "test_group" {
  value = data.akamai_group.test_group
}

data "akamai_appsec_configuration" "my_appsec_config" {
     name = "Akamai Uni"
     

}
output "my_appsec_config" {
     value=data.akamai_appsec_configuration.my_appsec_config
}

data "akamai_property" "test_property" {
  name    = "testingapisoshetty"
  version = "1"
}

output "test_property" {
  value = data.akamai_property.test_property
}