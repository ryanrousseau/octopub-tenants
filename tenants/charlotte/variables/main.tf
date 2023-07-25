terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-variables-charlotte"
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

variable "tenant_id" {
  type = string
}

variable "cluster_name" {
  type = string
}

data "octopusdeploy_environments" "environment" {
  name         = "Production"
}

data "octopusdeploy_projects" "octopub_frontend" {
  name         = "Octopub Frontend"
}

resource "octopusdeploy_tenant_common_variable" "cluster_name" {
  library_variable_set_id = "LibraryVariableSets-2082"
  template_id = "c587f126-c22f-4dd6-bedf-fb6805ac3c17"
  tenant_id = var.tenant_id
  value = var.cluster_name
}

resource "octopusdeploy_tenant_project_variable" "theme" {
  project_id = data.octopusdeploy_projects.octopub_frontend.projects[0].id
  environment_id = data.octopusdeploy_environments.environment.environments[0].id
  template_id = "b67f0b4c-b7e0-42a0-be43-1019621da593"
  tenant_id = var.tenant_id
  value = "blue"
}