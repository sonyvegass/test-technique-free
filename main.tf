terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.28.0"
    }
    kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">=2.23.0"
    }
    helm = {
        source  = "hashicorp/helm"
        version = "2.11.0"
    }
    local = {
        source  = "hashicorp/local"
        version = "2.4.0"
    }
    kubectl = {
        source  = "gavinbunney/kubectl"
        version = "1.14.0"
    }
  }
  required_version = ">= 1.0.0"
  backend "remote" {
    organization = "test-technique-free"

    workspaces {
      name = "mon-premier-workspace-sonia"
    }
  }
}

provider "scaleway" {
  region = "fr-par"
}
