resource "oci_core_internet_gateway" "IG-1" {
  compartment_id = module.compartment.cid
  vcn_id = module.CreateVCN.vcn.id
  display_name = "IG-1"
}
