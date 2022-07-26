#stage 1
#Start with a base image containing Java runtime
FROM openjdk:11-slim as build

EXPOSE 8080

ARG JAR_FILE=target/simprest-0.1.jar
ADD ${JAR_FILE} app.jar

#unpackage jar file
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf /app.jar)

##stage 2
##Same Java runtime
FROM openjdk:11-slim
# without above line: failed to solve with frontend dockerfile.v0: failed to create LLB definition: circular dependency detected on stage: build
#
##Add volume pointing to /tmp
VOLUME /tmp

#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring

#ARG DEPENDENCY=target/dependency
#COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY ${DEPENDENCY}/META-INF /app/META-INF
#COPY ${DEPENDENCY}/BOOT-INF/classes /app

ARG DEPENDENCY=/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

##at this point, /app.jar, and /target/dependency/* are never used/accessed -- could be removed!
## you need /app/*

ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.rest.Application"]
