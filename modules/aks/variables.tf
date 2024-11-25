variable "location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
  default = "westcentralus"
}

variable "rg_name" {
  description = "Name of the resource group in which to create the AKS cluster"
  type        = string
  default = "aks-resource-group"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default = "aks-task"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Size of the VM instances in the AKS node pool"
  type        = string
  default     = "Standard_B2s"
}

variable "kubernetes_version" {
  description = "Specifies the version of Kubernetes to use for the AKS cluster."
  type        = string
  default = "1.29.2"
}

