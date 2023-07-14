output "subnet_v4" {
  value     = phpipam_first_free_subnet.subnet_v4
}
output "subnet_v6" {
  value     = phpipam_first_free_subnet.subnet_v6
}

output "addresses_v4" {
  value     = phpipam_first_free_address.addresses_v4
}
output "addresses_v6" {
  value     = phpipam_first_free_address.addresses_v6
}
