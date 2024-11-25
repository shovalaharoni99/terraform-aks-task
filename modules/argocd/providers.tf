terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}
