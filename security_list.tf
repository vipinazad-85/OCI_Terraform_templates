resource "oci_core_security_list" "http_list" {
  compartment_id = module.compartment.cid
  vcn_id = module.CreateVCN.vcn.id
  display_name = "http_security_list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all"
  }

  ingress_security_rules {
    protocol = "6"
    // tcp
    source = "0.0.0.0/0"
    stateless = false
    tcp_options {
      //source_port_range { //describe the details for source port
      // max = 0
      // min = 0
      //}
      //Destination port range
      max = 80
      min = 80
    }
  }

    ingress_security_rules {
    protocol = "6"
    // tcp
    source = "0.0.0.0/0"
    stateless = false

      tcp_options {
      max = 22
      min = 22
    }
  }
}