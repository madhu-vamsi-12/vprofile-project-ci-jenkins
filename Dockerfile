FROM ubuntu:22.04
WORKDIR /app
RUN apt-get update -y
RUN apt-get -y java nginx
COPY vprofile-project-ci-jenkins ./
RUN mv vprofile-project-ci-jenkins index.html
RUN mv index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "daemon off;"]
