FROM nginx:stable
RUN sudo rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Toronto /etc/localtime
COPY site /usr/share/nginx/html
