# Step A: Base Image select karna
FROM nginx:alpine

# Step B: Apni banayi hui file ko container ke andar dalna
COPY index.html /usr/share/nginx/html/index.html

# Step C: Network port batana
EXPOSE 80
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
