output "namespaces" {
  description = "Lista de namespaces criados"
  value = [
    kubernetes_namespace.monitoring.metadata[0].name,
    kubernetes_namespace.apps.metadata[0].name,
    kubernetes_namespace.infra.metadata[0].name,
  ]
}
