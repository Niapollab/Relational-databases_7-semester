# LICENSE UPL 1.0
#
# Copyright (c) 2018, 2022 Oracle and/or its affiliates.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This is the Dockerfile for Oracle Database 21c Express Edition
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# None
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Run:
#      $ docker build -t oracle/database:21.3.0-xe -f Dockerfile.xe .
#
#
# Pull base image
# ---------------
FROM oraclelinux:7-slim

# Labels
# ------
LABEL "provider"="Oracle"                                               \
      "issues"="https://github.com/oracle/docker-images/issues"         \
      "volume.data"="/opt/oracle/oradata"                               \
      "volume.setup.location1"="/opt/oracle/scripts/setup"              \
      "volume.setup.location2"="/docker-entrypoint-initdb.d/setup"      \
      "volume.startup.location1"="/opt/oracle/scripts/startup"          \
      "volume.startup.location2"="/docker-entrypoint-initdb.d/startup"  \
      "port.listener"="1521"                                            \
      "port.oemexpress"="5500"                                          \
      "port.apex"="8080"

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ARG IMAGE_FILE
ARG ORACLE_PWD

ENV ORACLE_BASE=/opt/oracle \
    ORACLE_HOME=/opt/oracle/product/21c/dbhomeXE \
    ORACLE_BASE_HOME=/opt/oracle/homes/OraDBHome21cXE \
    ORACLE_SID=XE \
    ORACLE_PWD=$ORACLE_PWD \
    RUN_FILE="runOracle.sh" \
    PWD_FILE="setPassword.sh" \
    CREATE_DB_FILE="createDB.sh" \
    USER_SCRIPTS_FILE="runUserScripts.sh" \
    CONF_FILE="oracle-xe-21c.conf" \
    CHECK_SPACE_FILE="checkSpace.sh" \
    CHECK_DB_FILE="checkDBStatus.sh" \
    SETUP_LINUX_FILE="setupLinuxEnv.sh" \
    CONFIG_TCPS_FILE="configTcps.sh" \
    INSTALL_DIR="$HOME/install" \
    ORACLE_DOCKER_INSTALL="true" \
    CHECKPOINT_FILE_EXTN=".created"

# Use second ENV so that variable get substituted
ENV PATH=$ORACLE_HOME/bin:$PATH

# Copy binaries
# -------------
COPY bin/$CHECK_SPACE_FILE bin/$CONF_FILE bin/$SETUP_LINUX_FILE bin/$RUN_FILE bin/$PWD_FILE bin/$CHECK_DB_FILE bin/$CREATE_DB_FILE bin/$USER_SCRIPTS_FILE bin/$CONFIG_TCPS_FILE $INSTALL_DIR/
ADD $IMAGE_FILE $INSTALL_DIR/image.rpm

RUN cd $INSTALL_DIR && \
    mkdir -p $ORACLE_BASE && \
    mv $RUN_FILE $PWD_FILE $CHECK_DB_FILE $CREATE_DB_FILE $USER_SCRIPTS_FILE $CONFIG_TCPS_FILE $ORACLE_BASE/ && \
    chmod ug+x *.sh && \
    sync && \
    ./$CHECK_SPACE_FILE && \
    yum -y install expect && \
    ./$SETUP_LINUX_FILE && \
    chown -R oracle:oinstall $ORACLE_BASE /home/oracle && \
    sed -i -r 's/(^session\s+include\s+system-auth)/# \1/' /etc/pam.d/su && \
    unbuffer yum -y install $INSTALL_DIR/image.rpm && \
    yum -y remove expect && \
    rm -rf /var/cache/yum && \
    rm -rf /var/tmp/yum-* && \
    mv $CONF_FILE /etc/sysconfig/ && \
    cd $HOME && \
    rm -rf $INSTALL_DIR && \
    $ORACLE_BASE/oraInventory/orainstRoot.sh && \
    $ORACLE_HOME/root.sh && \
    echo 'export ORACLE_SID=XE' > .bashrc

RUN rm -rf $INSTALL_DIR/image.rpm

USER oracle
WORKDIR /home/oracle

HEALTHCHECK --interval=1m --start-period=5m --timeout=30s \
   CMD "$ORACLE_BASE/$CHECK_DB_FILE" >/dev/null || exit 1

ADD scripts/ /opt/oracle/scripts/setup
RUN $ORACLE_BASE/$RUN_FILE --nowait
RUN rm -rf /opt/oracle/scripts/setup/*

CMD exec $ORACLE_BASE/$RUN_FILE
