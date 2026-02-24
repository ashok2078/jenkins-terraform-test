FROM nginx:alpine
# Default files ko poori tarah saaf karna
RUN rm -rf /usr/share/nginx/html/*
# Aapki file ko sahi jagah copy karna
COPY index.html /usr/share/nginx/html/index.html
# Permissions set karna (safety ke liye)
RUN chmod 644 /usr/share/nginx/html/index.html
