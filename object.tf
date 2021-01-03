resource "oci_objectstorage_bucket" "lab_bucket" {
     compartment_id = data.oci_identity_compartments.lab_compartments.compartments[1].id
     name           = "lab-bucket"
     namespace      = var.namespace
}
