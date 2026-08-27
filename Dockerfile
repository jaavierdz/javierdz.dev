# Usa la imagen ligera de Nginx
FROM nginx:alpine

# 1. Copiar primero el archivo de configuración a la ruta de Nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# 2. Limpiar el contenido por defecto de Nginx
RUN rm -rf /usr/share/nginx/html/*

# 3. Copiar solo los archivos web a la raíz HTML de Nginx
COPY index.html /usr/share/nginx/html/
COPY terminal.txt /usr/share/nginx/html/
# Si tienes más archivos o carpetas estáticas (assets, css, etc.), añádelos explícitamente o copia una carpeta:
# COPY public/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]