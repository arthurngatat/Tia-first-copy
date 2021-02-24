FROM httpd

WORKDIR /usr/local/apache2/htdocs/
RUN wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/www.liyeplimal.net.zip \
    unzip www.liyeplimal.net.zip \
    rm -rf www.liyeplimal.net.zip \
    cp -R www.liyeplimal.net/* . \
    rm -rf www.liyeplimal.net 

CMD "catalina.sh" "run"
EXPOSE 80



FROM tomcat:latest

WORKDIR /opt
RUN mkdir pebble

WORKDIR /opt/pebble
RUN wget http://prdownloads.sourceforge.net/pebble/pebble-2.6.4.zip?download
RUN unzip -q pebble-2.6.4.zip\?download

RUN rm -rf /usr/local/tomcat/webapps/*

RUN cd /opt/pebble/pebble-2.6.4 && cp -r pebble-2.6.4.war /usr/local/tomcat/webapps
RUN cd /usr/local/tomcat/webapps && mv pebble-2.6.4.war pebble.war
RUN cd /opt && rm -rf pebble

EXPOSE 8080
CMD ["catalina.sh", "run"]



