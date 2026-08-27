# Usa la imagen ligera de Nginx
FROM nginx:alpine

# Copia tu configuración personalizada de Nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Copia los archivos estáticos de tu web (index.html, terminal.txt, etc.)
COPY . /usr/share/nginx/html/

# Elimina archivos de configuración de Git si se copiaron
RUN rm -rf /usr/share/nginx/html/.git* /usr/share/nginx/html/.github*

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]