# employee-demo
sd



## Build the Application
### Compile Applicaiton without JUnit Tests
```
mvn clean package -Dmaven.test.skip
```



### Compile Applicaiton with JUnit Tests
```
mvn clean package -Dspring.profiles.active=integration \
      -Dspring.datasource.username=bitnami \
      -Dspring.datasource.password=bitnami 
```
