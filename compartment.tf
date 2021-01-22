module "compartment" {
  source = "./compartment"
  comp_name= "OCI_LAB"
  compartment_id = var.compartment_id
}