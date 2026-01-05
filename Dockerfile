# Use Java 17
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy pom.xml first (to leverage Docker cache)
COPY pom.xml .

# Install Maven
RUN apt-get update && apt-get install -y maven

# Download dependencies (cache layer)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Expose the default Spring Boot port
EXPOSE 8080

# Run the jar
CMD ["java", "-jar", "target/*.jar"]
