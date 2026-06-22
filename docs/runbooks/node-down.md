# Runbook — NodeDown

## Alerta
NodeDown — severity: critical

## Sintoma
kubectl get nodes mostra STATUS NotReady.
Alerta dispara quando up{job="node-exporter"} == 0 por mais de 1 minuto.

## Impacto
- Pods rescheduleados nos workers restantes
- Capacidade do cluster reduzida em 33% por worker down
- Se master: API do cluster indisponivel

## Causa provavel
1. VM desligada no VirtualBox
2. Servico k3s-agent parado
3. Problema de rede na interface enp0s8

## Diagnostico
    kubectl get nodes
    kubectl describe node <nome-do-node>
    kubectl get events --field-selector reason=NodeNotReady
    ssh glauber@192.168.100.1x
    sudo systemctl status k3s-agent
    sudo journalctl -u k3s-agent --tail=30

## Acoes
1. Verificar se VM esta ligada no VirtualBox
2. ssh glauber@192.168.100.1x
3. sudo systemctl status k3s-agent
4. Se parado: sudo systemctl restart k3s-agent
5. Verificar rede: ping 192.168.100.10
6. Se sem rede: sudo netplan apply

## Resolucao esperada
kubectl get nodes mostra Ready em ate 2 minutos apos restart do agente.

## Escalacao
Se node nao voltar em 10 minutos, recriar VM a partir do clone base.
