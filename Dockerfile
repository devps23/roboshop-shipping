# FROM       docker.io/amazoncorretto:17

FROM             apache/beam_java17_sdk
WORKDIR          /app
COPY            /shipping

