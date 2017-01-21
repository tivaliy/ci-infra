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
2. Run ``./start_ci.sh up -d``
3. Access ``http://PROXY_HOST`` in your browser:

    * Access Gerrit -- ``http://PROXY_HOST/gerrit``
    * Access Jenkins -- ``http://PROXY_HOST/jenkins``
4. Stop and remove all containers and networks ``./destroy_ci.sh``
5. (Optionally) Remove ``VOLUME_PATH`` directory ``sudo rm -rf /your/volume/path``

*NOTE: Currently there is no any integration between Gerrit and Jenkins yet.
The process of their configuration should be performed manually.*