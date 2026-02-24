FROM nginx:alpine
# Purani default file hatana zaroori hai
RUN rm -rf /usr/share/nginx/html/*
# Aapki nayi index.html copy karna
COPY index.html /usr/share/nginx/html/index.html
