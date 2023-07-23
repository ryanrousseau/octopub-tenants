output "tenant_id" {
  description = "Tenant ID"
  value       = octopusdeploy_tenant.tenant.id
}

output "tenant_name" {
  description = "Name of the tenant"
  value       = octopusdeploy_tenant.tenant.name
}

output "environment_name" {
  description = "Environment the tenant is connected to"
  value = "Production"
}