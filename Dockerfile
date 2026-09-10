FROM nginx:alpine

# 1. Limpiar las configuraciones por defecto de Nginx
RUN rm -rf /etc/nginx/conf.d/*

# 2. Copiar tu configuración personalizada (default.conf)
COPY default.conf /etc/nginx/conf.d/default.conf

# 3. Limpiar la carpeta web e importar TODOS los archivos del proyecto
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/.git
RUN rm -rf /usr/share/nginx/html/.github
RUN rm -rf /usr/share/nginx/html/Dockerfile
RUN rm -rf /usr/share/nginx/html/default.conf
RUN rm -rf /usr/share/nginx/html/README.md

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]