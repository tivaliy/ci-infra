********
ci-infra
********

ci-infra provides a set of scripts (based on Docker Compose) to manage Continuous Integration infrastructure.

=================
ci-infra services
=================

* gerrit
* jenkins

======================
used docker containers
======================

* db-gerrit (`mysql:latest <https://hub.docker.com/_/mysql/>`_)
* gerrit (`openfrontier/gerrit <https://hub.docker.com/r/openfrontier/gerrit/>`_)
* jenkins (`jenkins:latest <https://hub.docker.com/r/_/jenkins/>`_)
* proxy (`nginx:stable-alpine <https://hub.docker.com/_/nginx/>`_)

===========
Quick start
===========
1. Set required variables in the ``env.config`` file
2. Ensure network doesn't overlap with already existing ones in your system.
   Please update ip address if required:

      networks:
      ci-infra-net:
        driver: bridge
        driver_opts:
          "com.docker.network.bridge.name": "ci-infra-net"
        ipam:
          driver: default
          config:
          - subnet: 172.18.0.0/24
            gateway: 172.18.0.1

3. Run ``./start_ci.sh up -d``
4. Access ``http://PROXY_HOST`` in your browser:

    * Access Gerrit -- ``http://PROXY_HOST/gerrit``
    * Access Jenkins -- ``http://PROXY_HOST/jenkins``

5. Stop and remove all containers and networks ``./destroy_ci.sh``
6. (Optionally) Remove ``VOLUME_PATH`` directory ``sudo rm -rf /your/volume/path``

*NOTE: Currently there is no any integration between Gerrit and Jenkins yet.
The process of their configuration should be performed manually.*