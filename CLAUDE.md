# Contexto do Projeto — Homelab DevOps/SRE/Observabilidade
## Glauber Arrighi | Junho 2026

## QUEM SOU EU
Profissional de infraestrutura e DevOps com 15 anos de experiencia em ambientes criticos.
Experiencia real em Azure (AKS), GCP, Kubernetes, Grafana, Prometheus, Keycloak, Cloudflare Zero Trust.
Objetivo: portfólio DevOps/SRE publico no GitHub para recolocação profissional.

## AMBIENTE DO LAB
- Host: Windows 11 Pro | AMD Ryzen 5 4600G | 32GB RAM
- Hypervisor: VirtualBox 7.2.8
- k3s-master:    192.168.100.10 | Control plane k3s v1.35.5
- k3s-worker-01: 192.168.100.11 | Worker node
- k3s-worker-02: 192.168.100.12 | Worker node
- monitoring:    192.168.100.20 | Stack de observabilidade

## STACK ATUAL
- Kubernetes: k3s v1.35.5+k3s1
- Helm: v3.21.1
- Prometheus + Grafana + Alertmanager (kube-prometheus-stack)
- Node Exporter em todos os nos
- Grafana: http://192.168.100.10:3000 (admin/admin123)

## REPOSITORIO
- GitHub: https://github.com/glauber-arrighi/homelab-observability
- Clone local: C:\Users\Glauber Arrighi\homelab-observability

## REGRAS DE TRABALHO
- Commits em portugues, formato Conventional Commits: feat:, fix:, docs:, chore:, ci:
- Namespaces Kubernetes: monitoring, apps, infra
- Nunca commitar secrets, .env ou kubeconfig
- Sempre explicar decisoes tecnicas em docs/architecture.md

## PROXIMA TAREFA
Criar os arquivos iniciais e fazer o primeiro commit real do projeto.
