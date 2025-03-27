FROM          docker.io/maven
RUN           mkdir /app
WORKDIR       /app
COPY          ./ /app/
RUN           mvn  package
RUN           mv target/shipping-1.0.jar shipping.jar


