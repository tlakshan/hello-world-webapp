FROM openjdk:11-jre-slim

WORKDIR /app

COPY ./target/*.war /app/hello-world.war
EXPOSE 8085
CMD ["java", "-jar", "/app/hello-world.war"]