FROM tomcat:8
MAINTAINER piesecurity <admin@pie-secure.org>
RUN set -ex && rm -rf /usr/local/tomcat/webapps/*
ADD https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0.2/agent-java/trend_app_protect-4.4.6.jar /usr/local/tomcat/lib/trend_app_protect.jar
ENV TREND_AP_LOG_LEVEL "DEBUG"
ENV CATALINA_OPTS "${CATALINA_OPTS} -javaagent:/usr/local/tomcat/lib/trend_app_protect.jar"
COPY struts2-showcase-2.3.12.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
