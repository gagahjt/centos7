# centos7
centos7+java8

Build centos7+java8 images with dockerfile


docker bulid  -t centos7:java8 .

or

docker bulid -f="DockerfileLocal" -t centos7:java8 .

--------------------------

#docker run -d -p 58080:8080 -v /_docker_data/webapps/:/usr/local/tomcat/webapps -v /_docker_data/logs/:/usr/local/tomcat/logs/ [imageid]	

#docker run -i -t -p 58080:8080 -v /_docker_data/webapps/:/usr/local/tomcat/webapps -v /_docker_data/logs/:/usr/local/tomcat/logs/  [image d] /bin/bash  ---stdin centos 

