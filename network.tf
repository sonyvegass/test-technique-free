resource "scaleway_vpc_private_network" "private-network" {
  name   = "private-network-${var.prenom}"
  region = "fr-par"

  ipv4_subnet {
    subnet = "10.0.0.0/22"
  }
} // celle-ci sera à supprimer

resource "scaleway_vpc" "vpc" {
    name = "vpc-${var.prenom}"
}

resource "scaleway_vpc_private_network" "private-network-2" {
    name   = "private-network-${var.prenom}-2"
    vpc_id = scaleway_vpc.vpc.id
    region = "fr-par"
}