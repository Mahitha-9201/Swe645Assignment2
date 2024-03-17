FROM nginx:alpine

COPY studentsurvey.html /usr/share/nginx/html
COPY studentsurvey.css /usr/share/nginx/html
COPY masonlogo.png /usr/share/nginx/html

EXPOSE 80


