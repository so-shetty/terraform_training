data "akamai_contracts" "all" {}
data "akamai_groups" "all" {}

/*output "contracts" {
  value = data.akamai_contracts.all.contracts
}

output "groups" {
  value = data.akamai_groups.all.groups
}



/*data "akamai_group" "all" {
  contract_id = "ctr_1-1NC95D"
  group_name = "Soshetty"
     
}

output "all_group" {
  value = data.akamai_group.all
}

data "akamai_appsec_configuration" "myappsecall" {
  name = "Soshetty WAF"
}

output "appsecall" {
  value = data.akamai_appsec_configuration.myappsecall
}

*/
data "akamai_appsec_contracts_groups" "my_contracts_groups" {
  contractid = "1-1NC95D"
  groupid = "94456"
}




/*data "akamai_products" "allp" {}
output "products" {
  value = data.akamai_products.allp.products
}
*/


