#!/bin/bash
set -e

JENKINS_HOME="/var/jenkins_home"
JENKINS_SSH_DIR="${JENKINS_HOME}/.ssh"

# Create directory for jenkins ssh key
if [ ! -d "${JENKINS_SSH_DIR}" ]; then
    mkdir -p "${JENKINS_SSH_DIR}";
fi

# Generate SSH key for jenkins with EMPTY password
if [ ! -f ${JENKINS_SSH_DIR}/"id_rsa" ]; then
    echo "Generating Jenkins Key Pair"
    rm -f ${JENKINS_SSH_DIR}/id_rsa.pub
    ssh-keygen -t rsa -f ${JENKINS_SSH_DIR}/'id_rsa' -b 4096 -N '';
    echo "================================================"
    echo "------------------ id_rsa.pub ------------------"
    echo "================================================"
    cat ${JENKINS_SSH_DIR}/id_rsa.pub
    echo "================================================"
fi
