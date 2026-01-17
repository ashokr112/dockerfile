FROM   quay.io/centos/centos:stream9
LABEL author: "Ashok Rawat"
RUN     yum install httpd python3 -y \
        && sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf \
        && echo "print (Hello Ashok, This is my first docker file created)" > mail.py \
        && chmod u+x mail.py \
        && mkdir -p /var/run/httpd /var/log/httpd \
        && chown -R apache:apache /var/run/httpd /var/log/httpd \
        && chmod -R 777 /var/run/httpd /var/log/httpd \
        && mkdir src \
        && yum clean all 
COPY    src/ /var/www/html
EXPOSE  8080
USER    apache
ENV USER_NAME=Ashok
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
