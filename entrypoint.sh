#!/usr/bin/env bash
# Guardar uptime del contenedor de Azure
#
# Author: Javier Rodríguez-Alarcón <javier@javierdz.dev>
# Date: 10-09-2026
# License: MIT


# Guardar el tiempo de inicio en formato epoch (segundos)
START_TIME=$(date +%s)
mkdir -p /usr/share/nginx/html/api

# Bucle en segundo plano para actualizar el uptime
while true; do
    CURRENT_TIME=$(date +%s)
    UPTIME=$((CURRENT_TIME - START_TIME))
    echo "{\"uptime_seconds\": $UPTIME}" > /usr/share/nginx/html/api/uptime.json
    sleep 5
done &

# Iniciar Nginx en primer plano
exec nginx -g 'daemon off;'