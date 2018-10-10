FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80 443


FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
