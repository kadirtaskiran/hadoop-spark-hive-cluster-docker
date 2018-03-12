FROM cloudnesil/serf-dnsmasq:1.1

MAINTAINER JoeWoo <0wujian0@gmail.com>

# install openssh-server, vim and openjdk
RUN yum install -y openssh-server openssh-clients vim
RUN yum install -y java-1.8.0-openjdk

# move all configuration files into container
ADD files/bashrc /usr/local/
ADD files/hadoop-env.sh /usr/local/
ADD files/spark-env.sh /usr/local/
ADD files/hive-env.sh /usr/local/
ADD files/ssh_config /usr/local/
ADD files/hadoop-3.0.0 /usr/local/hadoop-3.0.0
ADD files/scala-2.11.11 /usr/local/scala-2.11.11
ADD files/spark-2.3.0-bin-hadoop2.7 /usr/local/spark-2.3.0
ADD files/mysql-connector-java-5.1.6.jar /usr/local/mysql-connector-java-5.1.6.jar
ADD files/apache-hive-2.3.2-bin /usr/local/hive-2.3.2
ADD files/hive-hwi-1.2.1.war /usr/local/hive-hwi-1.2.1.war

# set jave environment variable
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64
ENV PATH $PATH:$JAVA_HOME/bin
RUN java -version

#install scala 2.10.4
RUN ln -s /usr/local/scala-2.11.11 /usr/local/scala
ENV SCALA_HOME=/usr/local/scala
ENV PATH $PATH:$SCALA_HOME/bin
#RUN scala -version

#configure ssh free key access
RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
mv /usr/local/ssh_config ~/.ssh/config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#install hadoop 2.6.4
RUN ln -s /usr/local/hadoop-3.0.0 /usr/local/hadoop && \
ls /usr/local/hadoop && \
mv /usr/local/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh

#install spark 2.3.0
RUN ln -s /usr/local/spark-2.3.0 /usr/local/spark
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin
RUN ls /usr/local/spark && \
mv /usr/local/spark-env.sh /usr/local/spark/conf/spark-env.sh

# install hive 1.2.1
RUN ln -s /usr/local/hive-2.3.2 /usr/local/hive
ENV HIVE_HOME /usr/local/hive
ENV PATH $PATH:$HIVE_HOME/bin
RUN mv /usr/local/hive-env.sh /usr/local/hive/conf/hive-env.sh
RUN mv /usr/local/hive-hwi-1.2.1.war /usr/local/hive/lib/hive-hwi-1.2.1.war
# install mysql-java-connecter for hive
RUN ln -s /usr/local/mysql-connector-java-5.1.6.jar /usr/local/hive/lib/mysql-connector-java-5.1.6.jar


RUN mv /usr/local/bashrc ~/.bashrc
