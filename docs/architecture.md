# Architecture Decision Records — homelab-observability

## ADR-001: Escolha do k3s em vez de kubeadm ou kind

**Data:** Junho 2026
**Status:** Aceito

**Contexto:**
Necessidade de cluster Kubernetes local para lab de DevOps/SRE com recursos limitados (VMs no VirtualBox com 4GB RAM cada).

**Decisao:**
Usar k3s v1.35.5 como distribuicao Kubernetes.

**Motivos:**
- Instala em menos de 2 minutos via script
- Consome ~512MB RAM no master vs ~2GB do kubeadm
- Usado em producao em ambientes edge e on-prem
- API 100% compativel com Kubernetes upstream
- Helm e kubectl funcionam sem modificacao

**Alternativas descartadas:**
- kubeadm: mais complexo, overhead maior, sem beneficio adicional para lab
- kind: roda dentro do Docker, menos realista para simular producao
- minikube: single-node, nao permite testar comportamento multi-node

---

## ADR-002: Rede Host-Only em vez de Bridge

**Data:** Junho 2026
**Status:** Aceito

**Contexto:**
VMs no VirtualBox precisam se comunicar entre si e com o host Windows.

**Decisao:**
Usar dois adaptadores de rede em cada VM:
- Adaptador 1 (NAT): acesso a internet para downloads
- Adaptador 2 (Host-Only 192.168.100.0/24): comunicacao interna do cluster

**Motivos:**
- Host-Only cria rede isolada e controlada
- IPs fixos garantem que o cluster sempre encontra os nodes
- NAT garante acesso a internet sem expor as VMs externamente
- Bridge dependeria da rede do ambiente — menos portavel

**IPs definidos:**
- 192.168.100.10: k3s-master (control plane)
- 192.168.100.11: k3s-worker-01
- 192.168.100.12: k3s-worker-02
- 192.168.100.20: monitoring

---

## ADR-003: kube-prometheus-stack via Helm

**Data:** Junho 2026
**Status:** Aceito

**Contexto:**
Necessidade de stack completa de observabilidade: metricas, visualizacao e alertas.

**Decisao:**
Instalar kube-prometheus-stack via Helm chart da prometheus-community.

**Motivos:**
- Instala Prometheus + Grafana + Alertmanager + Node Exporter em um unico comando
- Dashboards Kubernetes pre-configurados (Compute Resources, Node Exporter, etc)
- CRDs do Prometheus Operator permitem configurar alertas como YAML versionado no Git
- Amplamente adotado em producao

**Configuracao utilizada:**
- Retencao de metricas: 7 dias
- Grafana admin: configurado via secret
- Admission webhooks: habilitados com patch automatico de certificados

**Problemas encontrados e resolvidos:**
Ver docs/troubleshooting/ para detalhes completos dos 6 issues resolvidos durante o setup.

---

## ADR-004: IP fixo via Netplan em vez de DHCP

**Data:** Junho 2026
**Status:** Aceito

**Contexto:**
Kubernetes exige que o IP dos nodes seja estavel entre reinicializacoes.

**Decisao:**
Configurar IPs fixos via /etc/netplan/50-cloud-init.yaml em cada VM.

**Motivos:**
- DHCP pode atribuir IPs diferentes apos reinicializacao
- Kubernetes registra o node pelo IP — mudanca de IP quebra o cluster
- Netplan e o padrao de configuracao de rede no Ubuntu 24.04

**Configuracao aplicada em cada node:**
Interface enp0s8 (Host-Only) com IP estatico /24, sem gateway (comunicacao local apenas).
Interface enp0s3 (NAT) com DHCP para acesso a internet.
