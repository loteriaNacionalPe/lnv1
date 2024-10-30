FROM openjdk:17-jdk-alpine as builder

WORKDIR /app/msvc-juegos

COPY ./pom.xml /app
COPY ./msvc-juegos/.mvn ./.mvn
COPY ./msvc-juegos/mvnw .
COPY ./msvc-juegos/pom.xml .

RUN ./mvnw clean package -Dmaven.test.skip -Dmaven.main.skip -Dspring-boot.repackage.skip && rm -r ./target/
#RUN ./mvnw dependency:go-offline
COPY ./msvc-juegos/src ./src

RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-alpine

WORKDIR /app
RUN mkdir ./logs
COPY --from=builder /app/msvc-juegos/target/msvc-juegos-0.0.1-SNAPSHOT.jar .
EXPOSE 8002

ENTRYPOINT ["java", "-jar", "msvc-juegos-0.0.1-SNAPSHOT.jar"]
#CMD ["java", "-jar", "msvc-juegos-0.0.1-SNAPSHOT.jar"]
