#!/bin/bash

echo HOLA

#0 * * * * cd /root/elastic && /bin/curator --config config.yaml rollover.yaml >> /root/elastic/log/rollover.log 2>&1
#0 0  * * * cd /root/elastic && /bin/curator --config config.yaml delete.yaml >> /root/elastic/log/delete.log 2>&1