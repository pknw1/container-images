# Pull base image.
FROM phusion/baseimage:latest

ENV JAVAVERSION 7
ENV DEBIAN_FRONTEND noninteractive
ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11
ENV CATALINA_HOME /opt/tomcat

ENV JAVA_MAXMEMORY 256

ENV TOMCAT_MAXTHREADS 250
ENV TOMCAT_MINSPARETHREADS 4
ENV TOMCAT_HTTPTIMEOUT 20000
ENV TOMCAT_JVM_ROUTE tomcat80
ENV DEPLOY_DIR /webapps
ENV LIBS_DIR /libs
ENV PATH $PATH:$CATALINA_HOME/bin

RUN \
  apt-get update && \
  apt-get install -y curl wget pwgen software-properties-common

# Install Java and clean up download cache.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java${JAVAVERSION}-installer

RUN \
  rm -rf /var/cache/oracle-jdk${JAVAVERSION}-installer && \
  rm -f /usr/lib/jvm/java-${JAVAVERSION}-oracle/src.zip && \
  rm -f /usr/lib/jvm/java-${JAVAVERSION}-oracle/javafx-src.zip && \
  rm -rf /usr/share/doc /usr/share/man && \
  apt-get --purge remove -y software-properties-common && \
  apt-get autoremove -y && \
  apt-get clean


# INSTALL TOMCAT
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz  && \
  tar zxf apache-tomcat-*.tar.gz && \
  rm apache-tomcat-*.tar.gz && \
  mv apache-tomcat* ${CATALINA_HOME}

# Remove unneeded apps and files
RUN rm -rf ${CATALINA_HOME}/webapps/examples ${CATALINA_HOME}/webapps/docs ${CATALINA_HOME}/webapps/ROOT ${CATALINA_HOME}/webapps/host-manager ${CATALINA_HOME}/RELEASE-NOTES ${CATALINA_HOME}/RUNNING.txt ${CATALINA_HOME}/bin/*.bat  ${CATALINA_HOME}/bin/*.tar.gz


ADD server.xml ${CATALINA_HOME}/conf/server.xml
ADD logging.properties ${CATALINA_HOME}/conf/logging.properties
ADD create_tomcat_user.sh ${CATALINA_HOME}/bin/create_tomcat_user.sh
ADD tomcat.sh ${CATALINA_HOME}/bin/tomcat.sh
RUN chmod +x ${CATALINA_HOME}/bin/*.sh

RUN groupadd -r tomcat -g 433 && \
useradd -u 431 -r -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin -c "Docker image user" tomcat && \
chown -R tomcat:tomcat ${CATALINA_HOME}

RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /opt/tomcat

EXPOSE 8080

USER tomcat
CMD ["/opt/tomcat/bin/tomcat.sh"]

