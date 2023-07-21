terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-variables-chicago"
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
