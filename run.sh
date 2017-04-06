#!/bin/sh -x


docker run -it --net=host -v /var/absdata/servicephone-pbx-custom-mazdasto:/etc/asterisk -v /var/absdata/servicephone-pbx-moh:/var/lib/asterisk/moh -v /var/absdata/servicephone-pbx-ivr:/var/lib/asterisk/hello servicephone-1 

