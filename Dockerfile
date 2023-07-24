FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get -y java nginx
RUN mv vprofile-project-ci-jenkins index.html
RUN mv index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "daemon off;"]
