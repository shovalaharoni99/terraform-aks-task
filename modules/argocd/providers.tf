terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.16.1" # Adjust the version as needed
    }
  }
}



provider "helm" {
  # Configuration will be passed from the root module.
}
