# Usa l'immagine ufficiale di Nginx
FROM nginx:1.25

# Rimuovi la configurazione di default di Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia la tua configurazione personalizzata di Nginx nella posizione corretta
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copia i certificati SSL
COPY certs/ftasteserver.crt /etc/nginx/certs/ftasteserver.crt
COPY certs/ftasteserver.key /etc/nginx/certs/ftasteserver.key

# Imposta i permessi corretti per i certificati
RUN chmod 644 /etc/nginx/certs/ftasteserver.crt
RUN chmod 600 /etc/nginx/certs/ftasteserver.key



# Esponi la porta 443 (HTTPS) e la porta 80 (HTTP)
EXPOSE 443
EXPOSE 80

# Comando di default per avviare Nginx
CMD ["nginx", "-g", "daemon off;"]

