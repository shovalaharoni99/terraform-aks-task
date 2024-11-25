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


resource "kubernetes_manifest" "argocd_parent_app" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata"   = {
      "name"      = "parent-app"
      "namespace" = "argocd" # Ensure this is the namespace where ArgoCD is installed
    }
    "spec" = {
      "project" = "default" # Ensure this project exists in ArgoCD

      "source" = {
        "repoURL"        = "https://github.com/your-org/your-repo.git"
        "path"           = "apps" # Path in the repo where child app manifests are stored
        "targetRevision" = "HEAD"
      }

      "destination" = {
        "server"    = "https://kubernetes.default.svc"
        "namespace" = "argocd" # Child apps' namespace
      }

      "syncPolicy" = {
        "automated" = {
          "prune"    = true
          "selfHeal" = true
        }
      }
    }
  }
}

