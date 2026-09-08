FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src
COPY webapp ./webapp

RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY --from=build /app/target/LibraryApp.war /usr/local/tomcat/webapps/LibraryApp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
