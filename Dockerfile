FROM tomcat:9
COPY target/ansidoc.war /usr/local/tomcat/webapps/ansidoc.war
