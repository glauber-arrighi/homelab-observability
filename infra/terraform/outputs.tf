output "namespaces_criados" {
  description = "Namespaces provisionados pelo Terraform"
  value       = module.namespaces.namespaces
}
