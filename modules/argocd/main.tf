# install arcocd om aks 
resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = var.namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_helm_chart_version

  create_namespace = true

  set {
    name  = "server.service.type"
    value = var.argocd_service_type
  }

}


