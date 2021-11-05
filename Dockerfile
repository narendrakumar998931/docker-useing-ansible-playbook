FROM tomcat:8
COPY target/ansidoc.war /usr/local/tomcat/webapps/ansidoc.war
