terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-variables-atlanta"
  }

  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

provider "azurerm" {
   features {}
}

provider "octopusdeploy" {
  space_id      = "Spaces-688"
}

import {
  to = octopusdeploy_tenant_common_variable.something
  id = "Tenants-935:LibraryVariableSets-2024:e0af2d75-5c93-48fd-8b3e-cf64f72f9abb"
}