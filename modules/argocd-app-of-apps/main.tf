resource "kubectl_manifest" "destination_namespace" {
  yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: ${var.destination_namespace}
YAML
}

resource "kubectl_manifest" "parent_app" {
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ${var.app_name}
  namespace: ${var.argocd_namespace}
spec:
  project: ${var.project}
  source:
    repoURL: ${var.repo_url}
    path: ${var.repo_path}
    targetRevision: ${var.target_revision}
  destination:
    server: ${var.destination_server}
    namespace: ${var.destination_namespace}
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
YAML

  depends_on = [kubectl_manifest.destination_namespace]
}


