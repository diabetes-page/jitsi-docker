ARG JITSI_REPO=jitsi

FROM debian:buster as jitsi-meet-web-builder

COPY jitsi-meet/ /opt/jitsi-meet
RUN \
    apt-get update && \
    apt-get install -y build-essential git curl dh-make && \
    curl -fsSL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs

WORKDIR /opt/jitsi-meet/

RUN npm install
RUN make
RUN dpkg-buildpackage -d -A -rfakeroot -us -uc -tc 


FROM ${JITSI_REPO}/base

ADD https://raw.githubusercontent.com/acmesh-official/acme.sh/2.8.8/acme.sh /opt
COPY rootfs/ /
COPY --from=jitsi-meet-web-builder /opt/jitsi-meet-* /jitsi-meet/

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
