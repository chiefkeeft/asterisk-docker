#!/bin/sh -x


apt-get -qq update
apt-get -y install wget
apt-get -y install libxml2-dev libjansson-dev libncurses5-dev libgsm1-dev libspeex-dev libspeexdsp-dev libssl-dev libsqlite3-dev subversion build-essential uuid-dev unixodbc-dev pkg-config
useradd --create-home --shell /bin/bash asterisk
mkdir -p /usr/src/asterisk
chown -R asterisk:asterisk /usr/src/asterisk/
cd /usr/src/asterisk/
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13-current.tar.gz
tar zxvf asterisk*
/usr/src/asterisk/asterisk-*/contrib/scripts/install_prereq -y install
apt-get -y install lame
apt-get -y install libxml2-dev uuid-dev libncurses5-dev build-essential libsqlite3-dev
su asterisk
cd  /usr/src/asterisk/asterisk-*/
./configure
make menuselect.makeopts
menuselect/menuselect   --disable BUILD_NATIVE   --enable cdr_csv   --enable chan_sip   --enable res_snmp   --enable res_http_websocket   --enable MOH-OPSOUND-G729 --enable MOH-OPSOUND-G722 --enable MOH-OPSOUND-ALAW --enable MOH-OPSOUND-ULAW --enable res_hep_pjsip --enable res_hep_rtcp --enable CORE-SOUNDS-EN-G729 --enable CORE-SOUNDS-EN-G722 --enable CORE-SOUNDS-EN-ALAW --enable CORE-SOUNDS-EN-ULAW
make
make install
chown -R asterisk:asterisk /etc/asterisk
cp /usr/src/asterisk/asterisk-13.*/contrib/init.d/rc.debian.asterisk /etc/init.d/asterisk
cp /usr/src/asterisk/asterisk-13.*/contrib/init.d/etc_default_asterisk /etc/default/asterisk
chown -R asterisk:asterisk /var/run/asterisk/
chown -R asterisk:asterisk /var/lib/asterisk/
chown -R asterisk:asterisk /var/log/asterisk/
chown -R asterisk:asterisk /var/spool/asterisk/
chown -R asterisk:asterisk /usr/sbin/asterisk

echo "d /var/run/asterisk 0775 asterisk asterisk" > /etc/tmpfiles.d/asterisk.conf
wget http://asterisk.hosting.lv/bin/codec_g729-ast130-gcc4-glibc2.2-x86_64-core2-sse4.so -O codec_g729.so
mv codec_g729.so /usr/lib/asterisk/modules/

### odbc install

apt-get -y install wget unixodbc unixodbc-dev libpq-dev
mkdir /usr/src/postgresql-odbc
cd /usr/src/postgresql-odbc
wget https://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-09.05.0210.tar.gz
tar xzvf psqlodbc-09.05.0210.tar.gz
cd psqlodbc-09.05.0210
chmod +x /usr/bin/odbc_config
./configure
make && make install


