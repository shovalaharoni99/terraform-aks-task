variable "kube_config" {
  description = "Kubeconfig for connecting to the Kubernetes cluster."
}

variable "argocd_helm_chart_version" {
  description = "Version of the ArgoCD Helm chart to be deployed."
  type        = string
}


variable "argocd_service_type" {
  description = "Service type for the ArgoCD server (LoadBalancer, ClusterIP, NodePort)."
  type        = string
  default     = "ClusterID"
}

variable "namespace" {
  description = "Namespace where ArgoCD will be installed"
  type        = string
  default     = "argocd"
}
