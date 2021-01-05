variable "compartment_id" {}
variable "sub_cidr_block" {}
variable "sub_display_name" {}
variable "sub_dns_label" {}

variable "vcn_default_security_list_id" { type = list}
variable "vcn_id" {}
variable "vcn_default_route_table_id" {}
variable "vcn_default_dhcp_options_id" {}

variable "availability_domain" {}
variable "subnet_prohibit_public_ip_on_vnic" {}

output "subnet" {
  value = oci_core_subnet.test_subnet.id
}