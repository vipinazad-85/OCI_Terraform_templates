module "Subnet"  {
  source                          = "./subnets"
  availability_domain             = data.oci_identity_availability_domain.ad.name
  sub_cidr_block                  = var.sub_cidr_block
  sub_display_name                = var.sub_display_name
  sub_dns_label                   = var.sub_dns_label
  vcn_default_security_list_id    = [module.CreateVCN.vcn.default_security_list_id]
  compartment_id                  = module.compartment.cid
  vcn_id                          = module.CreateVCN.vcn.id
  vcn_default_route_table_id      = oci_core_route_table.route_table.id
  vcn_default_dhcp_options_id     = module.CreateVCN.vcn.default_dhcp_options_id
  subnet_prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic

}

module "DMZSubnet"  {
  source                          = "./subnets"
  availability_domain             = data.oci_identity_availability_domain.ad.name
  sub_cidr_block                  = var.DMZ_sub_cidr_block
  sub_display_name                = var.DMZ_sub_display_name
  sub_dns_label                   = var.DMZ_sub_dns_label
  vcn_default_security_list_id    = [oci_core_security_list.http_list.id]
  compartment_id                  = module.compartment.cid
  vcn_id                          = module.CreateVCN.vcn.id
  vcn_default_route_table_id      = module.CreateVCN.vcn.default_route_table_id
  vcn_default_dhcp_options_id     = module.CreateVCN.vcn.default_dhcp_options_id
  subnet_prohibit_public_ip_on_vnic = var.DMZ_subnet_prohibit_public_ip_on_vnic

}
