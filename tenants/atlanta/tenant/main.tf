terraform {
  backend "azurerm" {
    resource_group_name  = "demo.octopus.app"
    storage_account_name = "octodemotfstate"
    container_name       = "terraform-state"
    key                  = "tenant-atlanta"
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

data "octopusdeploy_environments" "environment" {
  name         = "Production"
}

data "octopusdeploy_projects" "all_octopub" {
  name         = "All Octopub"
}

data "octopusdeploy_projects" "mysql" {
  name         = "MySQL"
}

data "octopusdeploy_projects" "octopub_audits" {
  name         = "Octopub Audits"
}

data "octopusdeploy_projects" "octopub_frontend" {
  name         = "Octopub Frontend"
}

data "octopusdeploy_projects" "octopub_products" {
  name         = "Octopub Products"
}

resource "octopusdeploy_tenant" "tenant" {
  cloned_from_tenant_id = "Tenants-934"
  name                  = "Atlanta, GA"
  space_id              = "Spaces-688"
  tenant_tags           = ["Release Ring/Beta", "Rancher Token/Octopus Deploy token", "Azure Account/Azure Demo Subscription"]

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

  project_environment {
    environments = [ data.octopusdeploy_environments.environment.environments[0].id ]
    project_id   = data.octopusdeploy_projects.all_octopub.projects[0].id
  }

  project_environment {
    environments = [ data.octopusdeploy_environments.environment.environments[0].id ]
    project_id   = data.octopusdeploy_projects.mysql.projects[0].id
  }

  project_environment {
    environments = [ data.octopusdeploy_environments.environment.environments[0].id ]
    project_id   = data.octopusdeploy_projects.octopub_audits.projects[0].id
  }

  project_environment {
    environments = [ data.octopusdeploy_environments.environment.environments[0].id ]
    project_id   = data.octopusdeploy_projects.octopub_frontend.projects[0].id
  }

  project_environment {
    environments = [ data.octopusdeploy_environments.environment.environments[0].id ]
    project_id   = data.octopusdeploy_projects.octopub_products.projects[0].id
  }
}
