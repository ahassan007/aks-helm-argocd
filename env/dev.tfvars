data_look_prerequisites = {
  managed_identity = {
    name                = "mimsdndevopsc"
    location            = "uksouth"
    resource_group_name = "msdn-devops-sc"
  }
}

resource_group = {
  dev = {
    name     = "rg-aks-dev"
    location = "East US"
  }
}

kubernetes_cluster = {
  dev = {
    name                = "aks-argocd-dev"
    location            = "East US"
    dns_prefix          = "argocd-dev"
    default_node_pool   = {
      name       = "agent"
      node_count = 1
      vm_size    = "Standard_B2_v2"
    }
    identity            = {
      type         = "UserAssigned"
    }
    tags                = {
      Environment = "Dev"
    }
  }
}
