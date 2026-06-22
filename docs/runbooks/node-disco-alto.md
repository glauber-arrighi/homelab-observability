# Runbook — NodeDiscoAlto

## Alerta
NodeDiscoAlto — severity: warning

## Sintoma
Uso de disco acima de 85% no mountpoint /.
Expr: 100 - ((node_filesystem_avail_bytes / node_filesystem_size_bytes) * 100) > 85

## Impacto
- Risco de disco cheio causando falha de pods e do k3s
- Logs param de ser escritos
- etcd pode corromper se disco encher completamente

## Causa provavel
1. Imagens container acumuladas sem limpeza
2. Logs de containers crescendo sem rotacao
3. Dados do etcd crescendo

## Diagnostico
    ssh glauber@192.168.100.1x
    df -h
    du -sh /var/lib/rancher/k3s/*
    du -sh /var/log/*
    sudo crictl images

## Acoes
1. Verificar o que ocupa espaco: du -sh /*
2. Limpar imagens nao usadas: sudo crictl rmi --prune
3. Limpar logs antigos: sudo journalctl --vacuum-time=7d
4. Limpar imagens Docker antigas: sudo k3s crictl rmi --prune

## Resolucao esperada
Disco volta abaixo de 85% e alerta INACTIVE em ate 5 minutos.

## Escalacao
Se disco persistir alto apos limpeza, aumentar disco da VM no VirtualBox.
