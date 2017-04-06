FROM debian:jessie
COPY ./build.sh /tmp/
COPY ./start.sh /
COPY ./odbc_config /usr/bin/
ENV SIP_PORT 5061
ENV SIP_PORT_TCP 5061
ENV RTP_PORT_START 10000
ENV RTP_PORT_END 10150
RUN /bin/sh /tmp/build.sh
WORKDIR /root
COPY odbcinst.ini /etc/
COPY odbc.ini /etc/
RUN mkdir -p /home/asterisk/.postgresql
COPY postgresql.crt /home/asterisk/.postgresql/
COPY postgresql.key /home/asterisk/.postgresql/
COPY root.crt /home/asterisk/.postgresql/
RUN chmod -R 600 /home/asterisk/.postgresql/* 
RUN chown -R asterisk:asterisk /home/asterisk/.postgresql/
CMD ["/bin/sh", "/start.sh"]
