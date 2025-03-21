# Étape 1 : Compilation avec Maven et JDK 21
FROM maven:3.9.9-amazoncorretto-21-alpine AS build
WORKDIR /usr/src/app

# Copier les fichiers nécessaires
COPY pom.xml .
COPY src ./src

# Construire l'application
RUN mvn clean package -DskipTests

# Étape 2 : Exécution avec un JRE 21 léger
FROM amazoncorretto:21
WORKDIR /usr/app

# Copier le fichier JAR depuis l'étape de build
COPY --from=build /usr/src/app/target/java-pipeline-test-0.0.1-SNAPSHOT.jar /usr/app/app.jar

# Exposer le port utilisé par Spring Boot
EXPOSE 8080

# Lancer l'application
CMD ["java", "-jar", "app.jar"]
