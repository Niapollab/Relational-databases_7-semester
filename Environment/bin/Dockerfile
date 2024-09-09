# Use Oracle Database 21c Express Edition as base image
FROM container-registry.oracle.com/database/express:21.3.0-xe

# Set default character set to utf-8
ENV NLS_LANG=.AL32UTF8

# Set default password to Passw0rd
ENV ORACLE_PWD="Passw0rd"

# Copy scripts to the startup directory
COPY scripts/ /opt/oracle/scripts/startup/
