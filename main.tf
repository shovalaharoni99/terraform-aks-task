locals {
  location = "westcentralus"
  rg_name = "aks-task"
}

# Define Resource Group
resource "azurerm_resource_group" "my_resource_group" {
  name     = local.rg_name
  location = local.location
}

module "acr" {
  source                = "./modules/acr/"
  location              = local.location
  rg_name = local.rg_name
  acr_name = "myAcrDev3211"
  depends_on = [ azurerm_resource_group.my_resource_group ]
}

module "aks" {
  source                = "./modules/aks/"
  location              = local.location
  kubernetes_version    = "1.29.2"
  rg_name = local.rg_name
  cluster_name = "myAks"
  node_count = 2
  vm_size = "Standard_B2s"
  depends_on = [  azurerm_resource_group.my_resource_group ]
}

# Assign ACR Pull Permissions to AKS Managed Identity
resource "azurerm_role_assignment" "acr_pull_permission" {
  scope                = module.acr.acr_id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity

  # Ensure role assignment happens after ACR and AKS are created
  depends_on = [
    module.acr,
    module.aks
  ]
}

module "argocd" {
  source = "./modules/argocd"
  argocd_helm_chart_version = "7.7.5"
  argocd_service_type = "LoadBalancer"
  kube_config = module.aks.kube_config
  namespace = "argocd"
}


module "app_of_apps" {
  source                = "./modules/argocd-app-of-apps"
  app_name              = "parent-app"
  argocd_namespace      = module.argocd.namespace
  repo_url              = "https://github.com/shovalaharoni99/my-apps.git"
  repo_path             = "./"
  target_revision       = "main"
  destination_server    = "https://kubernetes.default.svc"
  destination_namespace = "parent-app"
 
   providers = {
    kubernetes = kubernetes
   }

   depends_on = [ module.aks, module.argocd ]
}




