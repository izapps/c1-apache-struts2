FROM tomcat:7
MAINTAINER piesecurity <admin@pie-secure.org>

COPY trend_app_protect-4.1.5.jar /usr/local/tomcat/trend_app_protect.jar
ENV CATALINA_OPTS="\${CATALINA_OPTS} -javaagent:/usr/local/tomcat/trend_app_protect.jar"

RUN set -ex \
	&& rm -rf /usr/local/tomcat/webapps/* \
	&& chmod a+x /usr/local/tomcat/bin/*.sh

COPY struts2-showcase-2.3.12.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
