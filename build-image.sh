docker build -t cloudnesil/serf-dnsmasq:1.1 serf-dnsmasq/
docker push cloudnesil/serf-dnsmasq:1.1
docker build -t cloudnesil/hive-mysql:1.1 hive-mysql/
docker push cloudnesil/hive-mysql:1.1
docker build -t cloudnesil/hadoop-base:1.1 hadoop-base/
docker push cloudnesil/hadoop-base:1.1
docker build -t cloudnesil/hadoop-master:1.1 hadoop-master/
docker push  cloudnesil/hadoop-master:1.1
docker build -t cloudnesil/hadoop-slave:1.1 hadoop-slave/
docker push cloudnesil/hadoop-slave:1.1
