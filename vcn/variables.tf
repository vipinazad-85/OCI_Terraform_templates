variable "compartment_id" {}
variable "vcn_cidr_block" {}
variable "vcn_display_name" {}
variable "vcn_dns_label" {}

output "vcn" {
  value = oci_core_vcn.test_vcn
}