resource "azurerm_resource_group" "cluster" {
  name     = "rg-gitops-demo"
  location = "westeurope"
  tags = local.tags
}

module "kubernetes" {
  source  = "amestofortytwo/aks/azurerm"
  version = "3.0.0"

  name                = "gitops-demo-westeu"
  resource_group_name = azurerm_resource_group.cluster.name
  location            = azurerm_resource_group.cluster.location

  aad_rbac = {
    enabled = true
    managed = true
    admin_group_object_ids = [
      data.azuread_group.cluster_admins.id
    ]
  }

  tags = local.tags
}