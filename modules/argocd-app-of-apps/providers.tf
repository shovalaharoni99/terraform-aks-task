terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}


provider "kubectl" {
  # Configuration will be passed from the root module.
}
