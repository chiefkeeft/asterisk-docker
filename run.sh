#!/bin/sh -x


docker run -it --net=host -v /var/absdata/setvicephone-pbx-moh:/var/lib/asterisk/moh -v /var/absdata/setvicephone-pbx-ivr:/var/lib/asterisk/heelo servicephone 

