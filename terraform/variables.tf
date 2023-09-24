locals {
  tags = {
    environment = "demo"
  }
}

variable "cluster_admin_group" {
  description = "The name of the Azure AD group that will be granted cluster admin rights."
  type = string
}

data "azuread_group" "cluster_admins" {
  display_name = var.cluster_admin_group
  security_enabled = true
}