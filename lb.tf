resource "scaleway_lb" "ingress_lb" {
  name       = "ingress-lb-${var.prenom}"
  type       = "LB-S"
  project_id = var.project_id
  ip_ids = [ scaleway_lb_ip.ingress_ip.id ]
  zone = scaleway_lb_ip.ingress_ip.zone
}

resource "scaleway_lb_ip" "ingress_ip" {
  project_id = var.project_id
}