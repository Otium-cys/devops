FROM gradle:jdk17-alpine AS BUILD
WORKDIR /backend_build
COPY . /backend_build
RUN gradle bootJar

FROM eclipse-temurin:17-jre-alpine
WORKDIR /backend
COPY --from=BUILD /backend_build/build/libs/*.jar /backend/backend.jar
EXPOSE 8080
CMD java -jar backend.jar