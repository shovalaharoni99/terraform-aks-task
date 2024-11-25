resource "kubernetes_manifest" "parent_app" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata"   = {
      "name"      = var.app_name
      "namespace" = var.argocd_namespace
    }
    "spec" = {
      "project" = var.project
      "source" = {
        "repoURL"        = var.repo_url
        "path"           = var.repo_path
        "targetRevision" = var.target_revision
      }

      "destination" = {
        "server"    = var.destination_server
        "namespace" = var.destination_namespace
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

output "app_name" {
  value = var.app_name
}
