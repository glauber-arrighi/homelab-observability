# Runbook — NodeCPUAlto

## Alerta
NodeCPUAlto — severity: warning

## Sintoma
CPU acima de 80% por mais de 5 minutos.
Expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80

## Impacto
- Performance degradada dos pods no node
- Possivel throttling de containers com CPU limits
- Risco de cascata se outros nodes tambem sob carga

## Causa provavel
1. Pod sem limits consumindo CPU excessiva
2. Processo do sistema em loop
3. Carga legitima — necessidade de scale out

## Diagnostico
    kubectl top nodes
    kubectl top pods --all-namespaces --sort-by=cpu
    kubectl describe node <nome-do-node>
    ssh glauber@192.168.100.1x
    top -b -n1 | head -20

## Acoes
1. Identificar pod consumindo CPU: kubectl top pods
2. Se carga legitima: kubectl scale deployment <nome> --replicas=3
3. Se processo SO em loop: sudo systemctl restart <servico>
4. Se k3s-agent com problema: sudo systemctl restart k3s-agent

## Resolucao esperada
CPU volta abaixo de 80% e alerta INACTIVE em ate 5 minutos.

## Escalacao
Se CPU persistir alta, avaliar aumentar vCPUs da VM no VirtualBox.
