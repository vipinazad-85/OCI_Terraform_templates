provider "oci" {}

#Common Variables
variable "compartment_id" {}

#Variables for object storage bucket
variable "namespace" {}

#Variables for instance
variable "num_instances" { default = "2" }
variable "instance_shape" { default = "VM.Standard.E2.1.Micro" }
variable "instance_ocpus" { default = 1 }
variable "instance_shape_config_memory_in_gbs" { default = 1.1 }
#Generated rsa format from public key (in format pem) command => vazad-mac:.oci vipinazad$ ssh-keygen -f oci_api_key_public.pem -i -mPKCS8
#command output => ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2NKZ2O3zvw54VJuVaFotrA1m0Pkyt5hC3SYV+gcXUWcNPIyTgYL40mJ+znXrOhqcJfVSfe/YMOf4LJHwAmFZiHqyx4j36B49icrzMsE7GOYesdIJTnYLohUuVPHztjMnHQFha+ibdgXCuXSKFQm52HXi/ZGwWl4JW7IrXT5OAwiprHBQN+IJy81D9pffCsWEXfDoGbzcAZ0+4nNcA+BR79EVMSUERtG3GfqAg8/MgQ90BV69l1mh7Uw9NI0gjganX4mNGf4optBWRGJkmKeCnOmzvcWgXYPtEbv2cDmp9lAP8nSFV5pPiq74HJsWp0Pk76p+zs2dRh6jbnFGz5ya5
variable "ssh_public_key" { default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2NKZ2O3zvw54VJuVaFotrA1m0Pkyt5hC3SYV+gcXUWcNPIyTgYL40mJ+znXrOhqcJfVSfe/YMOf4LJHwAmFZiHqyx4j36B49icrzMsE7GOYesdIJTnYLohUuVPHztjMnHQFha+ibdgXCuXSKFQm52HXi/ZGwWl4JW7IrXT5OAwiprHBQN+IJy81D9pffCsWEXfDoGbzcAZ0+4nNcA+BR79EVMSUERtG3GfqAg8/MgQ90BV69l1mh7Uw9NI0gjganX4mNGf4optBWRGJkmKeCnOmzvcWgXYPtEbv2cDmp9lAP8nSFV5pPiq74HJsWp0Pk76p+zs2dRh6jbnFGz5ya5 rsa-key-20160227"}

#Variables for VCN
variable "vcn_dns_label" {default = "vcn"}
variable "vcn_display_name" {default = "vcn"}
variable "vcn_cidr_block" {default = "10.1.0.0/16"}

#Variables for subnet => Subnet1
variable "sub_dns_label" {default = "subnet1"}
variable "sub_display_name" {default = "Subnet1"}
variable "sub_cidr_block" {default = "10.1.20.0/24"}
variable "subnet_prohibit_public_ip_on_vnic" {default = "false"}

#Variables for DMZ_Subnet1
variable "DMZ_sub_dns_label" {default = "dmzsubnet1"}
variable "DMZ_sub_display_name" {default = "DMZ_Subnet1"}
variable "DMZ_sub_cidr_block" {default = "10.1.21.0/24"}
variable "DMZ_subnet_prohibit_public_ip_on_vnic" {default = "true"}

#Variables for route table => route_table_IG
variable "route_table_display_name" {default = "route_table_IG"}


data "oci_identity_compartments" "lab_compartments" {
     compartment_id = var.compartment_id
     # only retain the compartment called lab-compartment
     #filter {
     #    name   = "name"
     #    values  = [ "test_lab"]
     #}
 }


output "lab_compartment" {
  value = data.oci_identity_compartments.lab_compartments
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_id
  ad_number      = 1
}

output "ad" {
  value = data.oci_identity_availability_domain.ad
}
