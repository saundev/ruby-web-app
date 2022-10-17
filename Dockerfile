FROM nginx
COPY index.html /usr/share/nginx/html/index.html

# Start NGINX server service
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
EXPOSE 443