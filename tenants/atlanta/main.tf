terraform {
    required_providers {
        octopusdeploy = {
            source = "OctopusDeployLabs/octopusdeploy"
        }
    }
}

provider "octopusdeploy" {
  space_id      = "Spaces-688"
}

resource "octopusdeploy_tenant" "atlanta" {
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
}
