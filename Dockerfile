#start a tomcat-base image
From centos:centos7
MAINTAINER "gagahjt" <hjt2009@foxmail.com>
ENV container docker

#install
#RUN yum install -y vim
RUN yum install -y wget

#prepare environment
ENV JAVA_HOME /usr/local/java
ENV CATALINA_HOME /usr/local/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts


#[install java8 by wget]
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
RUN tar -xvf jdk-8u111-linux-x64.tar.gz
RUN rm jdk*.tar.gz 
RUN mv jdk* ${JAVA_HOME}


#[install tomcat8  by wget]
#RUN wget http://apache.01link.hk/tomcat/tomcat-8/v8.5.6/bin/apache-tomcat-8.5.6.tar.gz
RUN wget http://apache.communilink.net/tomcat/tomcat-8/v8.5.6/bin/apache-tomcat-8.5.6.tar.gz
Run tar -xvf apache-tomcat-8.5.6.tar.gz
Run rm apache-tomcat*.tar.gz
Run mv apache-tomcat* ${CATALINA_HOME} 



RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat /usr/local/tomcat

#setting tomcat
#ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf/
ADD server.xml /usr/local/tomcat/conf/

#when you stdin centos default workdir
#WORKDIR $CATALINA_HOME/bin

# expose tomcat port
EXPOSE 8080
EXPOSE 8009


#run centos & tomcat
CMD ["catalina.sh", "run"]
#CMD /usr/local/tomcat/bin/catalina.sh run


#docker run -d -p 58080:8080 -v /_docker_data/webapps/:/usr/local/tomcat/webapps -v /_docker_data/logs/:/usr/local/tomcat/logs/ d6a3ab7f3849 
#docker run -d -p 58080:8080 -v /_docker_data/webapps/:/usr/local/tomcat/webapps -v /_docker_data/logs/:/usr/local/tomcat/logs/ d6a3ab7f3849 /bin/bash /usr/local/tomcat/bin/catalina.sh run
