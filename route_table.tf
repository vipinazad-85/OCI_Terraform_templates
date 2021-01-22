resource "oci_core_route_table" "route_table" {
  compartment_id = module.compartment.cid
  vcn_id = module.CreateVCN.vcn.id
  display_name = var.route_table_display_name

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.IG-1.id
   # destination_type = "Internet Gateway"
  }
}
