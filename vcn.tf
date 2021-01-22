module "CreateVCN"  {
  source = "./vcn"
  vcn_cidr_block     = var.vcn_cidr_block
  compartment_id     = module.compartment.cid
  vcn_display_name   = var.vcn_display_name
  vcn_dns_label      = var.vcn_dns_label
}


