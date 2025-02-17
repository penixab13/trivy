# Use Maven with JDK 11 for the build stage
FROM maven:3.9.9-amazoncorretto-23-alpine as build
# Copy the source code and pom.xml to the container
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  

WORKDIR /usr/src/app
# Run Maven to clean and build the project
RUN mvn clean package 

# Use OpenJDK 11 runtime for the final image
FROM amazoncorretto:8u442-alpine3.21-jre 

# Copy the JAR file from the build stage
COPY --from=build /usr/src/app/target/java-pipeline-test-SNAPSHOT.jar /usr/app/java-pipeline-test-0.0.1-SNAPSHOT.jar  

# Expose port 8080 for the application
EXPOSE 8080  

# Run the JAR file when the container starts
CMD ["java", "-jar", "/usr/app/java-pipeline-test-0.0.1-SNAPSHOT.jar"]
