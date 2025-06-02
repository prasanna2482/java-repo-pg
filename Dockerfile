ARG APP_NAME="hello-1.0.jar"
# Use an official Maven image that includes OpenJDK
RUN echo "App: $APP_NAME"
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Use an official Java runtime as a parent image for the final image
FROM openjdk:11-jre-slim

# Set the working directory inside the final container
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/target/*.jar app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]
