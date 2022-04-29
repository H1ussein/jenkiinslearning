FROM openjdk:8-jre-alpine
RUN ["java", "-version"]
RUN apt-get update
RUN apt-get install -y maven
WORKDIR/code
ADD pom.xml /code/pom.xml
ADD lib /code/lib
ADD src /code/src
RUN ["mvn", "clean"]
RUN ["mvn", "install"]
EXPOSE 8081
ENTRYPOINT ["java" , "-jar" , "target/recruitment-service-0.0.1.jar"]
