variable "app_name" {
  description = "Name of the parent ArgoCD application"
  type        = string
}

variable "argocd_namespace" {
  description = "Namespace where ArgoCD is installed"
  type        = string
}

variable "project" {
  description = "ArgoCD project for the parent application"
  type        = string
  default     = "default"
}

variable "repo_url" {
  description = "Git repository URL for child applications"
  type        = string
}

variable "repo_path" {
  description = "Path in the Git repository for child application manifests"
  type        = string
}

variable "target_revision" {
  description = "Git revision to sync (branch, tag, or commit)"
  type        = string
  default     = "HEAD"
}

variable "destination_server" {
  description = "Kubernetes cluster API server URL"
  type        = string
  default = "https://kubernetes.default.svc"
}

variable "destination_namespace" {
  description = "Namespace where child applications will be deployed"
  type        = string
}


