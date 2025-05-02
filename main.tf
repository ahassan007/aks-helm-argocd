resource "azurerm_resource_group" "aks_rg" {
  name     = "aks_devops_agent"
  location = "UK South"
}

# resource "azurerm_kubernetes_cluster" "agent" {
#   name                = "devops_agent"
#   location            = azurerm_resource_group.aks_rg.location
#   resource_group_name = azurerm_resource_group.aks_rg.name
#   dns_prefix          = "devops"

#   default_node_pool {
#     name       = "agent"
#     node_count = 1
#     vm_size    = "Standard_B2_v2"
#   }

#   identity {
#     type = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.this.id]
#   }

#   tags = {
#     Environment = "Dev"
#   }
# }

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.agent.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.agent.kube_config_raw
#   sensitive = true
# }