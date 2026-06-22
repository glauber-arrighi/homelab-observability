resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      env        = var.environment
      managed-by = "terraform"
    }
  }
}

resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
    labels = {
      env        = var.environment
      managed-by = "terraform"
    }
  }
}

resource "kubernetes_namespace" "infra" {
  metadata {
    name = "infra"
    labels = {
      env        = var.environment
      managed-by = "terraform"
    }
  }
}
