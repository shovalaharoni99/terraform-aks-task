terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.16.1" # Adjust the version as needed
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

provider "helm" {
  
}