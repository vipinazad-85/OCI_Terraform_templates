provider "oci" {}

variable "num_instances" { default = "2" }
variable "instance_shape" { default = "VM.Standard.E2.1.Micro" }
variable "instance_ocpus" { default = 1 }

variable "instance_shape_config_memory_in_gbs" { default = 1.1 }


variable "compartment_id" {}
variable "namespace" {}

variable "vcn_dns_label" {default = "vcn"}
variable "vcn_display_name" {default = "vcn"}
variable "vcn_cidr_block" {default = "10.1.0.0/16"}

variable "sub_dns_label" {default = "subnet1"}
variable "sub_display_name" {default = "Subnet1"}
variable "sub_cidr_block" {default = "10.1.20.0/24"}

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
