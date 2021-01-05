module "CreateVCN"  {
  source = "./vcn"
  vcn_cidr_block     = var.vcn_cidr_block
  compartment_id     = var.compartment_id
  vcn_display_name   = var.vcn_display_name
  vcn_dns_label      = var.vcn_dns_label
}


