[![CI/CD](https://github.com/glauber-arrighi/homelab-observability/actions/workflows/deploy.yml/badge.svg)](https://github.com/glauber-arrighi/homelab-observability/actions/workflows/deploy.yml)

# homelab-observability

Lab pessoal de DevOps/SRE com foco em observabilidade, infraestrutura como cÃ³digo e prÃ¡ticas de Site Reliability Engineering.

## Stack

| Camada | Tecnologia |
|---|---|
| OrquestraÃ§Ã£o | k3s v1.35.5 (Kubernetes leve) |
| Package manager | Helm v3.21.1 |
| MÃ©tricas | Prometheus + Node Exporter + cAdvisor |
| VisualizaÃ§Ã£o | Grafana |
| Logs | Loki + Promtail (em implantaÃ§Ã£o) |
| Alertas | Alertmanager |
| IaC | Terraform (em implantaÃ§Ã£o) |
| CI/CD | GitHub Actions |

## Ambiente

| VM | IP | FunÃ§Ã£o | RAM |
|---|---|---|---|
| k3s-master | 192.168.100.10 | Control plane | 4 GB |
| k3s-worker-01 | 192.168.100.11 | Worker node | 4 GB |
| k3s-worker-02 | 192.168.100.12 | Worker node | 4 GB |
| monitoring | 192.168.100.20 | Stack observabilidade | 6 GB |

- **Host:** Windows 11 Pro â€” AMD Ryzen 5 4600G â€” 32 GB RAM
- **Hypervisor:** VirtualBox 7.2.8
- **OS das VMs:** Ubuntu 24.04.4 LTS Server

## Estrutura do repositÃ³rio

```
homelab-observability/
â”œâ”€â”€ .github/workflows/       # Pipeline CI/CD (GitHub Actions)
â”œâ”€â”€ infra/
â”‚   â”œâ”€â”€ kubernetes/          # Manifests YAML do cluster
â”‚   â””â”€â”€ terraform/           # IaC â€” provisionamento
â”œâ”€â”€ observability/
â”‚   â”œâ”€â”€ prometheus/alerts/   # Regras de alerta
â”‚   â”œâ”€â”€ grafana/dashboards/  # Dashboards exportados como JSON
â”‚   â””â”€â”€ alertmanager/        # ConfiguraÃ§Ã£o de alertas
â”œâ”€â”€ apps/demo-app/           # AplicaÃ§Ã£o para gerar mÃ©tricas reais
â””â”€â”€ docs/
    â”œâ”€â”€ architecture.md      # DecisÃµes tÃ©cnicas (ADRs)
    â”œâ”€â”€ troubleshooting/     # Problemas resolvidos com causa raiz
    â”œâ”€â”€ runbooks/            # Procedimentos de incidente
    â””â”€â”€ postmortem/          # AnÃ¡lise pÃ³s-incidente
```

## Status do projeto

- [x] Cluster k3s com 3 nodes (master + 2 workers)
- [x] Stack de observabilidade: Prometheus + Grafana + Alertmanager
- [x] Node Exporter em todos os nÃ³s
- [x] Dashboards Kubernetes/Compute Resources funcionando
- [ ] Pipeline CI/CD com lint e validaÃ§Ã£o
- [ ] Demo-app com mÃ©tricas de aplicaÃ§Ã£o
- [ ] Terraform para IaC
- [ ] Alertas com regras reais (CPU, disco, node down)
- [ ] Runbooks documentados
- [ ] SLI/SLO com error budget

## Troubleshooting documentado

Problemas reais encontrados e resolvidos durante o setup â€” disponÃ­veis em `docs/troubleshooting/`:

- Certificado TLS x509 com IP errado no k3s
- INSTALL_K3S_EXEC nÃ£o funciona em runtime via service.env
- kube-prometheus-stack: job admission-create com BackoffLimitExceeded
- kubectl sem sudo: permission denied em k3s.yaml
- Helm: cluster unreachable localhost:8080
- scp do kubeconfig retornando Permission denied

## Por que este projeto

Profissional de infraestrutura e DevOps com 15 anos de experiÃªncia em ambientes crÃ­ticos, em transiÃ§Ã£o para prÃ¡ticas modernas de SRE e Cloud. Este lab demonstra implementaÃ§Ã£o real de observabilidade, IaC e CI/CD â€” nÃ£o apenas teoria.

**Stack de experiÃªncia real:** Azure (AKS) Â· GCP Â· Kubernetes Â· Grafana Â· Prometheus Â· Keycloak Â· Cloudflare Zero Trust Â· ITIL Â· COBIT

---

*Glauber Arrighi â€” [LinkedIn](https://www.linkedin.com/in/glauberarrighi/) Â· Porto Alegre, RS*
