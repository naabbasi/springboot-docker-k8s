#https://spring.io/guides/gs/spring-boot-docker/

FROM azul/zulu-openjdk-alpine:21-latest

WORKDIR /opt

COPY target/springboot-docker-k3d-jkube-0.0.1.jar springboot-docker-k3d-jkube-latest.jar

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","springboot-docker-k3d-jkube-latest.jar"]

EXPOSE 8080