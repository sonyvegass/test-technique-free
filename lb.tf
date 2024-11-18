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
/* 
resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress-${var.prenom}"
  chart      = "https://charts.bitnami.com/bitnami"
  version    = "9.1.9"
  namespace  = "kube-system"

  set {
    name  = "controller.service.loadBalancerIP"
    value = scaleway_lb.ingress_lb.ip_address
  }
  depends_on = [
    scaleway_lb.ingress_lb,
    scaleway_lb_ip.ingress_ip
  ]
} */