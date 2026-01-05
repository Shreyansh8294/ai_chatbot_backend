FROM eclipse-temurin:17-jdk

WORKDIR /app

RUN apt-get update && apt-get install -y maven

COPY pom.xml .
RUN mvn -B dependency:resolve dependency:resolve-plugins

COPY src ./src

RUN mvn -B -DskipTests package

EXPOSE 8080

CMD ["java", "-jar", "target/aichat-proxy-0.0.1-SNAPSHOT.jar"]
