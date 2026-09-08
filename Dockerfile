```dockerfile
FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY target/LibraryApp.war /usr/local/tomcat/webapps/LibraryApp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
```
