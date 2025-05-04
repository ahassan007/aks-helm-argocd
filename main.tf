resource "azurerm_resource_group" "aks_rg" {
  for_each = var.resource_group
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_kubernetes_cluster" "agent" {
  for_each = var.kubernetes_cluster
  name                = each.value.name
  location            = each.value.location
  dns_prefix          = each.value.dns_prefix
  resource_group_name = azurerm_resource_group.aks_rg[each.key].name
  tags = each.value.tags
  
  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }

  identity {
    type = each.value.identity.type
    identity_ids = [data.azurerm_user_assigned_identity.this["managed_identity"].id]
  }
}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.agent.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.agent.kube_config_raw
#   sensitive = true
# }