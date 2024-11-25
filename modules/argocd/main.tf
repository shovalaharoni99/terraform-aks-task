

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_helm_chart_version

  create_namespace = true

  values = [
    <<EOT
server:
  service:
    type: ${var.argocd_service_type}
EOT
  ]
}
