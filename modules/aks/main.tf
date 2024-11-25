
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.cluster_name
  kubernetes_version    =  var.kubernetes_version

   lifecycle {
    ignore_changes = [name]  
  }

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

   network_profile {
      network_plugin = "kubenet"
      load_balancer_sku = "standard"
  }

}



