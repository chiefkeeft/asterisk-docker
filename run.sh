#!/bin/sh -x


docker run -it --net=host -v /var/absdata/servicephone-pbx13:/etc/asterisk -v /var/absdata/servicephone-pbx-custom-mazdasto/db.d:/etc/asterisk/db.d -v /var/absdata/servicephone-pbx-custom-mazdasto/extensions.d:/etc/asterisk/extensions.d -v /var/absdata/servicephone-pbx-custom-mazdasto/users.d:/etc/asterisk/users.d -v /var/absdata/servicephone-pbx-custom-mazdasto/sip.d:/etc/asterisk/sip.d -v /var/absdata/servicephone-pbx-custom-mazdasto/scripts.d:/etc/asterisk/scripts.d -v /var/absdata/servicephone-pbx-custom-mazdasto/manager.d:/etc/asterisk/manager.d -v /var/absdata/servicephone-pbx-custom-mazdasto/queues.d:/etc/asterisk/queues.d -v /var/absdata/servicephone-pbx-moh:/var/lib/asterisk/moh -v /var/absdata/servicephone-pbx-ivr:/var/lib/asterisk/hello --name asterisk-mazdasto asterisk-mazdasto

