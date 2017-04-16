FROM debian:jessie
COPY ./build.sh /tmp/
COPY ./start.sh /
COPY ./odbc_config /usr/bin/
COPY jail.conf /tmp/
ENV SIP_PORT 5062
ENV SIP_PORT_TCP 5062
ENV RTP_PORT_START 10300
ENV RTP_PORT_END 10400
RUN /bin/sh /tmp/build.sh
WORKDIR /root
COPY odbcinst.ini /etc/
COPY odbc.ini /etc/
RUN mkdir -p /home/asterisk/.postgresql
COPY postgresql.crt /home/asterisk/.postgresql/
COPY postgresql.key /home/asterisk/.postgresql/
COPY root.crt /home/asterisk/.postgresql/
COPY asterisk*.conf /etc/fail2ban/filter.d/
RUN chmod -R 600 /home/asterisk/.postgresql/* 
RUN chown -R asterisk:asterisk /home/asterisk/.postgresql/
CMD ["/bin/sh", "/start.sh"]
