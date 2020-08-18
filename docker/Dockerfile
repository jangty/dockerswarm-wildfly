# Use latest jboss/base-jdk:11 image as the base
FROM jboss/wildfly:14.0.1.Final
# wildfly jdk edit.

ENV JBOSS_HOME /opt/jboss/wildfly

#USER root
#USER "701"


RUN /opt/jboss/wildfly/bin/add-user.sh asmanager asmanager --silent

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true


# ADD wildfly_config
ADD docker/wildfly_config/standalone.xml /opt/jboss/wildfly/standalone/configuration/
ADD docker/wildfly_config/standalone.conf $JBOSS_HOME/bin/

ADD docker/modules $JBOSS_HOME/modules/


# Add app
ADD SYS_TOOL/target/*.war /opt/jboss/wildfly/standalone/deployments/


## scouter
#USER jboss
RUN mkdir scouter
ADD docker/scouter scouter
RUN chmod -R 777 scouter && chown -R asmanager scouter

RUN mkdir scripts
COPY docker/entrypoint.sh scripts
RUN chmod -R 777 scripts && chown -R asmanager scripts


#USER jboss
#USER "701"

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Expose the ports we're interested in
EXPOSE 8080 9990 8009

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

CMD scripts/entrypoint.sh

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
# CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
