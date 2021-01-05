resource "oci_core_subnet" "test_subnet" {
  availability_domain = var.availability_domain
  cidr_block          = var.sub_cidr_block
  display_name        = var.sub_display_name
  dns_label           = var.sub_dns_label
  security_list_ids   = var.vcn_default_security_list_id
  compartment_id      = var.compartment_id
  vcn_id              = var.vcn_id
  route_table_id      = var.vcn_default_route_table_id
  dhcp_options_id     = var.vcn_default_dhcp_options_id
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
}

