FROM nginx:stable-alpine
MAINTAINER Vitalii Kulanov "vitaliy@kulanov.org.ua"

RUN set -x \
    && apk add --update --no-cache bash curl

COPY html /usr/share/nginx/html
COPY proxy.conf /etc/nginx/conf.d/default.conf
COPY nginx-entrypoint.sh /usr/local/bin/nginx-entrypoint.sh
RUN chmod +x /usr/local/bin/nginx-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/nginx-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
