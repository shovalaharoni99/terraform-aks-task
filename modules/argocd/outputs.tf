# output "argocd_server_url" {
#   description = "The URL to access the ArgoCD server."
#   value       = join("", ["http://", kubernetes_service.argocd_server.status.load_balancer.ingress[0].ip])
#   depends_on  = [helm_release.argocd]
# }

# output "argocd_admin_password" {
#   description = "The initial admin password for ArgoCD."
#   value       = kubernetes_secret.argocd_initial_admin_secret.data.password
#   sensitive   = true
#   depends_on  = [helm_release.argocd]
# }

# output "argocd_url" {
#   description = "The URL to access the ArgoCD UI."
#   value       = try(helm_release.argocd.status["load_balancer"]["ingress"][0]["hostname"], "LoadBalancer not ready yet")
# }