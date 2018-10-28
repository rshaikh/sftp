FROM alpine:3.7

LABEL maintainer="Amir Mofasser (@amimof)"

COPY sshd_config /etc/ssh/sshd_config
COPY server /
COPY entrypoint.sh /
RUN set -x \
&&  apk add --no-cache --update openssh bash \
&&  mkdir -p /var/run/sshd \
&&  chmod +x /server


RUN apk add nodejs --no-cache
RUN npm install http-server -g
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
