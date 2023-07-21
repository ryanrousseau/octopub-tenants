terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-dallas"
  }

  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}


provider "octopusdeploy" {
  space_id      = "Spaces-688"
}

resource "octopusdeploy_tenant" "dallas" {
  name                  = "Dallas, TX"
  space_id              = "Spaces-688"
  tenant_tags           = ["Release Ring/Alpha", "Azure Account/Azure Demo Subscription", "Rancher Token/Octopus Deploy token"]

  project_environment {
    environments = ["Environments-912"]
    project_id   = "Projects-1257"
  }

  project_environment {
    environments = ["Environments-912"]
    project_id   = "Projects-1258"
  }

  project_environment {
    environments = ["Environments-912"]
    project_id   = "Projects-2481"
  }
}
