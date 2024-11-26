

# Output for ACR Module
output "acr_name" {
  description = "The name of the Azure Container Registry."
  value       = module.acr.acr_name
}

output "acr_id" {
  description = "The ID of the Azure Container Registry."
  value       = module.acr.acr_id
}

# Output for AKS Module
output "aks_cluster_name" {
  description = "The name of the AKS cluster."
  value       = module.aks.cluster_name
}


# General Information Outputs
output "kubernetes_version" {
  description = "The Kubernetes version of the AKS cluster."
  value       = module.aks.kubernetes_version
}
    
