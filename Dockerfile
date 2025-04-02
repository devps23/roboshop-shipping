FROM          docker.io/maven As BUILD
RUN           mkdir /app
WORKDIR       /app
COPY          ./ /app/
RUN           mvn  package
RUN           mv target/shipping-1.0.jar shipping.jar


FROM          docker.io/amazoncorretto:17
RUN           yum install unzip -y
RUN           mkdir /app
WORKDIR       /app
RUN           curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && unzip newrelic-java.zip && rm -rf newrelic-java.zip
COPY          --from=BUILD /app/shipping.jar /app/shipping.jar
COPY            run.sh /app/run.sh
ENTRYPOINT      ["bash", "/app/run.sh" ]


