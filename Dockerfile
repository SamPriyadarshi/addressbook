FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY addressbook_main/target/*.war /usr/local/tomcat/webapps/
