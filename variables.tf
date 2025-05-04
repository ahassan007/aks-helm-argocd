variable "resource_group" {
  type = map(object({
    name = string
    location = string
  }))

  description = "Resource group configuration"
}

variable "kubernetes_cluster" {
  type = map(object({
    name                = string
    location            = string
    dns_prefix          = string
    default_node_pool   = object({
      name       = string
      node_count = number
      vm_size    = string
    })
    identity            = object({
      type         = string
      identity_ids = optional(list(string))
    })
    tags                = optional(map(string))
  }))
  
  description = "Kubernetes cluster configuration"
}

variable "data_look_prerequisites" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
  description = "Prerequisites configuration for data look"
}

