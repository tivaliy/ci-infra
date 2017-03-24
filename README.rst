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
* jenkins (`tivalii/jenkins <https://hub.docker.com/r/tivalii/jenkins/>`_ based on `jenkins:latest <https://hub.docker.com/r/_/jenkins/>`_)
* proxy (`nginx:stable-alpine <https://hub.docker.com/_/nginx/>`_)

===========
Quick start
===========
1. Set required variables in the ``env.config`` file
2. Ensure, that newly created network doesn't overlap with already existing ones
   in your system (see ``docker-compose.yml``):

.. code-block:: yaml

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
4. Put WWW content of your ``http://PROXY_HOST`` site to ``/your/volume/path/nginx/html`` (defaults to ``/srv/ci-infra/nginx/html``)
5. Access ``http://PROXY_HOST`` in your browser:

* Access Gerrit -- ``http://PROXY_HOST/gerrit``
* Access Jenkins -- ``http://PROXY_HOST/jenkins``

6. Stop and remove all containers and networks ``./destroy_ci.sh``
7. (Optionally) Remove ``VOLUME_PATH`` directory ``./destroy_ci.sh --force`` (defaults to ``/srv/ci-infra``)

=====
Notes
=====
Currently there is no any integration between Gerrit and Jenkins.
The process of their configuration should be performed manually.
