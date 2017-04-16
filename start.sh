#!/bin/sh -x

chmod 775 /etc/asterisk/
#set -e
#
#if [ -z "$ENV SIP_PORT" ]; then
#    echo "Default SIP PORT"
#else
#    echo "SIP Port changed"
#    sed -i "s/bindport=5061/bindport=$SIP_PORT/g" /etc/asterisk/sip.conf
#fi
#
#if [ -z "$ENV SIP_PORT_TCP" ]; then
#    echo "Default SIP PORT TCP"
#else
#    echo "SIP Port changed"
#    sed -i "s/tcpbindaddr=0.0.0.0:5061/tcpbindaddr=0.0.0.0:$SIP_PORT_TCP/g" /etc/asterisk/sip.conf
#fi
#
#
#if [ -z "$ENV RTP_PORT_START" ]; then
#    echo "Default RTP Port Start"
#else
#    echo "SIP RTP Start changed"
#    sed -i "s/rtpstart=10000/rtpstart=$RTP_PORT_START/g" /etc/asterisk/rtp.conf
#fi  
#
#if [ -z "$ENV RTP_PORT_END" ]; then 
#    echo "Default RTP Port End"
#else    
#    echo "SIP RTP END changed"
#    sed -i "s/rtpend=20000/rtpend=$RTP_PORT_END/g" /etc/asterisk/rtp.conf
#fi      
rm /var/run/fail2ban/fail2ban.sock || true
rm /etc/fail2ban/jail.conf
service fail2ban restart
/usr/sbin/asterisk -f -U asterisk
