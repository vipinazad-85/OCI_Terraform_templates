variable "compartment_id" {}
variable "comp_name" {}
output "cid" {
  value = oci_identity_compartment.oci_compartment.id
}