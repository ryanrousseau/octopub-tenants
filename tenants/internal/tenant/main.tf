terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-internal"
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

resource "octopusdeploy_tenant" "tenant" {
  name                  = "_Internal"
  space_id              = "Spaces-688"
  tenant_tags           = ["Azure Account/Azure Demo Subscription", "Release Ring/Alpha", "Event Platform Hosting/Hosting Group 3", "Feature Set/SSO", "Feature Set/Custom Branding", "Rancher Token/Octopus Deploy token"]

  project_environment {
    environments = ["Environments-910", "Environments-911", "Environments-912"]
    project_id   = "Projects-932"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-1257"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-1258"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2481"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2508"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2509"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2510"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2512"
  }

  project_environment {
    environments = ["Environments-910", "Environments-911"]
    project_id   = "Projects-2541"
  }
}