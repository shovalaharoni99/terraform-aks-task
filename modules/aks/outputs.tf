output "cluster_id" {
  description = "ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  description = "Kubeconfig for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config
  sensitive   = true
}


output "kubelet_identity" {
  description = "The kubelet identity for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}