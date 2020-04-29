# Use latest jboss/base-jdk:11 image as the base
FROM jboss/wildfly:14.0.1.Final
# wildfly jdk edit.

ENV JBOSS_HOME /opt/jboss/wildfly

USER root


RUN /opt/jboss/wildfly/bin/add-user.sh asmanager asmanager  --silent

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true


# ADD config
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/
COPY standalone.conf $JBOSS_HOME/bin/

#ARG SERVER_NAME
#ARG CLUSTER_PW

#ENV SERVER_NAME=${SERVER_NAME}
#ENV CLUSTER_PW=${CLUSTER_PW}

# Add app
ADD ./*.war /opt/jboss/wildfly/standalone/deployments/

USER jboss

# Expose the ports we're interested in
EXPOSE 8080 8009

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
