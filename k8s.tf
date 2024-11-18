resource "scaleway_k8s_cluster" "cluster" {
  name                        = "cluster-${var.prenom}"
  type                        = "kapsule"
  version                     = "1.29"
  cni                         = "cilium"

  delete_additional_resources = true
  autoscaler_config {
    ignore_daemonsets_utilization = true
    balance_similar_node_groups   = true
  }

  auto_upgrade {
    enable                        = true
    maintenance_window_day        = "sunday"
    maintenance_window_start_hour = 2
  }

  private_network_id          = scaleway_vpc_private_network.private-network-2.id

}

output "kapsule" {
    description = "Kapsule cluster id"
    value = scaleway_k8s_cluster.cluster.id
}

resource "scaleway_k8s_pool" "pool" {
  cluster_id = scaleway_k8s_cluster.cluster.id
  name       = "pool-${var.prenom}"
  node_type  = "PRO2-XXS"
  size       = 1
  min_size               = 1
  max_size               = 2
  autoscaling            = true
  autohealing            = true
  container_runtime      = "containerd"
  root_volume_size_in_gb = 32
}