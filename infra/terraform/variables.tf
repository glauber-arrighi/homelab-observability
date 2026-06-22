variable "kubeconfig_path" {
  description = "Caminho para o arquivo kubeconfig"
  type        = string
  default     = "/etc/rancher/k3s/k3s.yaml"
}

variable "environment" {
  description = "Ambiente do lab"
  type        = string
  default     = "lab"
}
