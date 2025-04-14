source /data/secrets.txt
cat /data/secrets.txt

if [ -z "$CART_ENDPOINT" ]; then
  echo "CART_ENDPOINT is missing"
  exit 1
fi

if [ -z "$DB_HOST" ]; then
  echo "DB_HOST is missing"
  exit 1
fi

if [ -z "$LICENSE_KEY" ]; then
  echo "LICENSE_KEY is missing"
  exit 1
fi

java -jar /app/shipping.jar

#java - javaagent:newrelic/newrelic.jar -Dnewrelic.config.license_key=${LICENSE_KEY} -jar /app/shipping.jar

#mysql -h $DB_HOST -uroot -pRoboShop@1 < /app/schema/shipping.sql  this is a schema
# here MYSQL-SERVER-IPADDRESS is a DB_HOST
# in our code DB_HOST is a rds end point

#java - javaagent:newrelic/newrelic.jar -Dnewrelic.config.license_key=${LICENSE_KEY} -jar /app/shipping.jar

#ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","/app/my-application.jar"]
# -Dnewrelic.config.license_key=YOUR_NEW_RELIC_LICENSE_KEY ---to add License key
# need to add -Dnewrelic.config.app_name=shipping
