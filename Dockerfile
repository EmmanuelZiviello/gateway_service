# Usa l'immagine ufficiale di Nginx
FROM nginx:1.25

# Rimuovi la configurazione di default di Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia la tua configurazione personalizzata di Nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

# Copia i certificati SSL
COPY certs/ftasteserver.crt /etc/nginx/certs/ftasteserver.crt
COPY certs/ftasteserver.key /etc/nginx/certs/ftasteserver.key

# Esponi la porta 80 (HTTP) e la porta 443 (HTTPS)
EXPOSE 80
EXPOSE 443

# Comando di default per avviare Nginx
CMD ["nginx", "-g", "daemon off;"]