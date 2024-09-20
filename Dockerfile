# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
