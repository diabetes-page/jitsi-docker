ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/base

ADD https://raw.githubusercontent.com/acmesh-official/acme.sh/2.8.8/acme.sh /opt
COPY rootfs/ /

RUN \
    apt-dpkg-wrap apt-get update && \
    apt-dpkg-wrap apt-get install -y cron nginx-extras && \
    apt-dpkg-wrap apt install -y /jitsi-meet/jitsi-meet-web_*.deb && \
    dpkg -x /jitsi-meet/jitsi-meet-web-config_*.deb /tmp/pkg && \
    mv /tmp/pkg/usr/share/jitsi-meet-web-config/config.js /defaults && \
	mv /usr/share/jitsi-meet/interface_config.js /defaults && \
	rm -f /etc/nginx/conf.d/default.conf && \
	apt-cleanup && \
	rm -rf /tmp/pkg /var/cache/apt

EXPOSE 80 443

VOLUME ["/config", "/usr/share/jitsi-meet/transcripts"]
