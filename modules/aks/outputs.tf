
# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
# #   sensitive = true
# }

# output "cluster_ca_certificate" {
#     value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
# }


# # output "client_key" {
# #     value = azurerm_kubernetes_cluster.aks.0.client_key
# # }

# output "host" {
#     value = azurerm_kubernetes_cluster.aks.kube_config.0.host
# }


output "cluster_id" {
  description = "ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  description = "Kubeconfig for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "kubelet_identity" {
  description = "The kubelet identity for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}