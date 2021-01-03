module "CreateVCN"  {
  source = "./vcn"
  vcn_cidr_block     = var.vcn_cidr_block
  compartment_id     = var.compartment_id
  vcn_display_name   = var.vcn_display_name
  vcn_dns_label      = var.vcn_dns_label
}

module "Subnet"  {
  source                          = "./subnets"
  availability_domain             = data.oci_identity_availability_domain.ad.name
  sub_cidr_block                  = var.sub_cidr_block
  sub_display_name                = var.sub_display_name
  sub_dns_label                   = var.sub_dns_label
  vcn_default_security_list_id    = [module.CreateVCN.vcn.default_security_list_id]
  compartment_id                  = var.compartment_id
  vcn_id                          = module.CreateVCN.vcn.id
  vcn_default_route_table_id      = module.CreateVCN.vcn.default_route_table_id
  vcn_default_dhcp_options_id     = module.CreateVCN.vcn.default_dhcp_options_id

}

