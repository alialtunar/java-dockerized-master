FROM java:8

WORKDIR /app/java_project/

# Java uygulamasının jar dosyasını ve bağımlılıklarını kopyala
COPY target/dockerized-0.0.1-SNAPSHOT.jar ./
COPY target/dependency-jars/* ./dependency-jars/

# Giriş dosyasını ve log konfigürasyon dosyasını kopyala
COPY src/test/resources/file.txt /tmp/docker/input/
COPY src/main/resources/log4j2.xml ./log4j2.xml

# Hacimler
VOLUME ["/tmp/docker/input", "/tmp/docker/output", "/tmp/docker/data/logs"]

# Java uygulamasını çalıştır
CMD ["java", "-Dlog4j.configurationFile=/app/java_project/log4j2.xml", "-jar", "dockerized-0.0.1-SNAPSHOT.jar"]
