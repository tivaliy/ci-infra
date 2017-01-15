********
ci-infra
********

ci-infra provides a set of scripts (based on Docker Compose) to manage Continuous Integration infrastructure.

=================
ci-infra services
=================

* gerrit

======================
used docker containers
======================

* db-gerrit (`mysql:latest <https://hub.docker.com/_/mysql/>`_)
* gerrit (`openfrontier/gerrit <https://hub.docker.com/r/openfrontier/gerrit/>`_)
* proxy (`nginx:stable-alpine <https://hub.docker.com/_/nginx/>`_)

===========
Quick start
===========
1. Set required variables in the ``env.config`` file
2. Run ``./start_ci.sh up -d``
3. Access ``http://PROXY_HOST`` in your browser
