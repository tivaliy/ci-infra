FROM jenkins:latest
MAINTAINER Vitalii Kulanov "vitaliy@kulanov.org.ua"

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
    gerrit-trigger \
    git \
    swarm

# Generate jenkins ssh key
COPY gen-ssh-key.sh /usr/local/bin/gen-ssh-key.sh

COPY jenkins-entrypoint.sh /usr/local/bin/jenkins-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/jenkins-entrypoint.sh"]