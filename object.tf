resource "oci_objectstorage_bucket" "lab_bucket" {
     compartment_id = module.compartment.cid
     name           = "lab-bucket"
     namespace      = var.namespace
}
