terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.16.1" # Adjust the version as needed
    }
  }
}

provider "azurerm" {
  
  features {}  # This block is required and can be left empty

  subscription_id = "af2b00b0-f252-4e56-962d-45d1d7653003"
}


provider "kubectl" {
      host                   = module.aks.kube_config[0].host
      client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
      client_key             = base64decode(module.aks.kube_config[0].client_key)
      cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)

}

provider "helm" {
    kubernetes{
      host                   = module.aks.kube_config[0].host
      client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
      client_key             = base64decode(module.aks.kube_config[0].client_key)
      cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)
  }
}










