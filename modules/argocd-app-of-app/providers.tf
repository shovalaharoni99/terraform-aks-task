terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.16.1" # Adjust the version as needed
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.kube_config[0].host
    client_certificate     = base64decode(var.kube_config[0].client_certificate)
    client_key             = base64decode(var.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(var.kube_config[0].cluster_ca_certificate)
  }
}
