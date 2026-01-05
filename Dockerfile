# Use official Java 17 runtime
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Maven wrapper & pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies (better caching)
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose Spring Boot default port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/*.jar"]
