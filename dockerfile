FROM tomcat:8.0-alpine

LABEL maintainer="ArtiP@hexaware.com"

ADD LoginWebApp.war /usr/local/tomcat/webapps/login.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
