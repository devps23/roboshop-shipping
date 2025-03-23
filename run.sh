source /data/secrets
cat /data/secrets

if [ -z "$CART_ENDPOINT" ]; then
  echo "CART_ENDPOINT is missing"
  exit 1
fi

if [ -z "$DB_HOST" ]; then
  echo "DB_HOST is missing"
  exit 1
fi


mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql
# here MYSQL-SERVER-IPADDRESS is a DB_HOST
# in our code DB_HOST is a rds end point

java -jar /app/shipping.jar