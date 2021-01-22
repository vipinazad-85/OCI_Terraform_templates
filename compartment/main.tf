resource "oci_identity_compartment" "oci_compartment" {
  compartment_id = var.compartment_id
  description = "This is testing compartment"
  name = var.comp_name
}