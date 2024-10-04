mvn -Dmaven.test.failure.ignore=true \
                        -Dspring.profiles.active=integration \
                        -Dspring.datasource.username=bitnami \
                        -Dspring.datasource.password=bitnami \
                        clean package

docker build -f Dockerfile \
     --build-arg JAR_FILE=target/thymeleafdemo-0.0.1-SNAPSHOT.jar \
     --build-arg IMAGE_VERSION=1.0.0-SNAPSHOT \
     -t employee-demo:1.0.0-SNAPSHOT .

docker run -p 8080:8080 \
  -e SPRING_DATASOURCE_USERNAME=bitnami \
  -e SPRING_DATASOURCE_PASSWORD=bitnami \
  employee-demo:1.0.0-SNAPSHOT



exit
curl -X POST -H 'Content-Type: application/json' http://localhost:8080/api/v1/subscription \
  -d '{"firstName": "Tom", "lastName": "Bread", "emailId": "tom.bread@test.org"}' 2>/dev/null | jq -r

curl -X GET -H 'Content-Type: application/json' http://localhost:8080/api/v1/subscription/1 | jq -r
