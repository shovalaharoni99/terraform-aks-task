terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.0.0"
    }
  }
}

provider "kubernetes" {
  # Configuration will be passed from the root module.
}
