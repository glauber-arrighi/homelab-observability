# homelab-observability

Lab pessoal de DevOps/SRE com foco em observabilidade, infraestrutura como código e práticas de Site Reliability Engineering.

## Stack

| Camada | Tecnologia |
|---|---|
| Orquestração | k3s v1.35.5 (Kubernetes leve) |
| Package manager | Helm v3.21.1 |
| Métricas | Prometheus + Node Exporter + cAdvisor |
| Visualização | Grafana |
| Logs | Loki + Promtail (em implantação) |
| Alertas | Alertmanager |
| IaC | Terraform (em implantação) |
| CI/CD | GitHub Actions |

## Ambiente

| VM | IP | Função | RAM |
|---|---|---|---|
| k3s-master | 192.168.100.10 | Control plane | 4 GB |
| k3s-worker-01 | 192.168.100.11 | Worker node | 4 GB |
| k3s-worker-02 | 192.168.100.12 | Worker node | 4 GB |
| monitoring | 192.168.100.20 | Stack observabilidade | 6 GB |

- **Host:** Windows 11 Pro — AMD Ryzen 5 4600G — 32 GB RAM
- **Hypervisor:** VirtualBox 7.2.8
- **OS das VMs:** Ubuntu 24.04.4 LTS Server

## Estrutura do repositório

```
homelab-observability/
├── .github/workflows/       # Pipeline CI/CD (GitHub Actions)
├── infra/
│   ├── kubernetes/          # Manifests YAML do cluster
│   └── terraform/           # IaC — provisionamento
├── observability/
│   ├── prometheus/alerts/   # Regras de alerta
│   ├── grafana/dashboards/  # Dashboards exportados como JSON
│   └── alertmanager/        # Configuração de alertas
├── apps/demo-app/           # Aplicação para gerar métricas reais
└── docs/
    ├── architecture.md      # Decisões técnicas (ADRs)
    ├── troubleshooting/     # Problemas resolvidos com causa raiz
    ├── runbooks/            # Procedimentos de incidente
    └── postmortem/          # Análise pós-incidente
```

## Status do projeto

- [x] Cluster k3s com 3 nodes (master + 2 workers)
- [x] Stack de observabilidade: Prometheus + Grafana + Alertmanager
- [x] Node Exporter em todos os nós
- [x] Dashboards Kubernetes/Compute Resources funcionando
- [ ] Pipeline CI/CD com lint e validação
- [ ] Demo-app com métricas de aplicação
- [ ] Terraform para IaC
- [ ] Alertas com regras reais (CPU, disco, node down)
- [ ] Runbooks documentados
- [ ] SLI/SLO com error budget

## Troubleshooting documentado

Problemas reais encontrados e resolvidos durante o setup — disponíveis em `docs/troubleshooting/`:

- Certificado TLS x509 com IP errado no k3s
- INSTALL_K3S_EXEC não funciona em runtime via service.env
- kube-prometheus-stack: job admission-create com BackoffLimitExceeded
- kubectl sem sudo: permission denied em k3s.yaml
- Helm: cluster unreachable localhost:8080
- scp do kubeconfig retornando Permission denied

## Por que este projeto

Profissional de infraestrutura e DevOps com 15 anos de experiência em ambientes críticos, em transição para práticas modernas de SRE e Cloud. Este lab demonstra implementação real de observabilidade, IaC e CI/CD — não apenas teoria.

**Stack de experiência real:** Azure (AKS) · GCP · Kubernetes · Grafana · Prometheus · Keycloak · Cloudflare Zero Trust · ITIL · COBIT

---

*Glauber Arrighi — [LinkedIn](https://www.linkedin.com/in/glauberarrighi/) · Porto Alegre, RS*
