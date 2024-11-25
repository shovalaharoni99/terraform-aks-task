# variable "kubeconfig" {
#   description = "Kubeconfig for connecting to the Kubernetes cluster."
#   type = object({
#     host                   = string
#     client_certificate     = string
#     client_key             = string
#     cluster_ca_certificate = string
#   })
# }

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for connecting to the AKS cluster"
  type        = string
}

variable "argocd_helm_chart_version" {
  description = "Version of the ArgoCD Helm chart to be deployed."
  type        = string
#   default     = "5.0.4"
}


variable "argocd_service_type" {
  description = "Service type for the ArgoCD server (LoadBalancer, ClusterIP, NodePort)."
  type        = string
  default     = "LoadBalancer"
}
