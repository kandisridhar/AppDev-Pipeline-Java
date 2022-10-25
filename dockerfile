FROM tomcat:9.0-jdk8-corretto 

LABEL maintainer="ArtiP@hexaware.com"

ADD LoginWebApp.war /usr/local/tomcat/webapps/login.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
