
resource "oci_core_instance" "test_instance" {
  count               = var.num_instances
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_id
  display_name        = "TestInstance${count.index}"

  #shape_config {
  #  ocpus = "${var.instance_ocpus}"
  #  memory_in_gbs = "${var.instance_shape_config_memory_in_gbs}"
  #}

  create_vnic_details {
    subnet_id        = module.Subnet.subnet
    display_name     = "Primaryvnic"
    assign_public_ip = true
    hostname_label   = "tfexampleinstance${count.index}"
  }
shape = "VM.Standard.E2.1.Micro"
source_details {
		source_id = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaazw753qijtnuynq6wrd3rmiayquc3kpijc7j5akprmvyzhcdhxsxq"
		source_type = "image"
	}
}



