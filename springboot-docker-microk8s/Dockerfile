#https://spring.io/guides/gs/spring-boot-docker/

FROM azul/zulu-openjdk-alpine:11

WORKDIR /opt

COPY target/springboot-rest-0.0.1-SNAPSHOT.jar springboot-rest-latest.jar

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","springboot-rest-latest.jar"]

EXPOSE 8080