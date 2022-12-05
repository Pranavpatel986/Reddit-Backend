#FROM openjdk:11
FROM maven


WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
EXPOSE 8090


# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package", "-DskipTests"]

CMD ["java", "-jar", "/code/target/Reddit-app.jar"]