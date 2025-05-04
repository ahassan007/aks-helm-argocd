data "azurerm_user_assigned_identity" "this" {
  for_each = {
    for key, value in var.data_look_prerequisites : key => value if key == "managed_identity"
  }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  
}

output "mi" {
  value = azurerm_user_assigned_identity.this
}