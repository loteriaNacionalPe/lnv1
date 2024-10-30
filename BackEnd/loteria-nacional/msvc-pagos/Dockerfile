FROM openjdk:17-jdk-alpine as builder

WORKDIR /app/msvc-pagos

COPY ./pom.xml /app
COPY ./msvc-pagos/.mvn ./.mvn
COPY ./msvc-pagos/mvnw .
COPY ./msvc-pagos/pom.xml .

RUN ./mvnw clean package -Dmaven.test.skip -Dmaven.main.skip -Dspring-boot.repackage.skip && rm -r ./target/
#RUN ./mvnw dependency:go-offline
COPY ./msvc-pagos/src ./src

RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-alpine

WORKDIR /app
RUN mkdir ./logs
COPY --from=builder /app/msvc-pagos/target/msvc-pagos-0.0.1-SNAPSHOT.jar .
EXPOSE 8003

ENTRYPOINT ["java", "-jar", "msvc-pagos-0.0.1-SNAPSHOT.jar"]
#CMD ["java", "-jar", "msvc-pagos-0.0.1-SNAPSHOT.jar"]
