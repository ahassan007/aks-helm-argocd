data "azurerm_user_assigned_identity" "this" {
  name                = "aktestmi001"
  resource_group_name = "test-rg"
}