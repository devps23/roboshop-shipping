FROM             docker.io/maven:3.9 As build-steps
RUN              dnf install unzip
RUN              mkdir /app
WORKDIR          /tmp
ADD              https://roboshop-artifacts.s3.amazonaws.com/shipping.zip  /tmp/shipping.zip
WORKDIR          /app
RUN              unzip /tmp/shipping.zip -d /app/
RUN              mvn package
RUN              mv target/shipping-1.0.jar shipping.jar



FROM             apache/beam_java17_sdk
RUN              dnf install mysql -y
RUN              mkdir /app
WORKDIR          /app
COPY             --from=build-steps /app/shipping.jar  /app/shipping.jar
COPY             run.sh  /app/run.sh

