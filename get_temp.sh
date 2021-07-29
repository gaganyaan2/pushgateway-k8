mkdir -p /opt/cron

echo '#!/bin/bash

cpu=$(</sys/class/thermal/thermal_zone0/temp)

cpu_temp=$(echo "$cpu/1000" | bc -l)

echo "raspberry_temp $cpu_temp" | curl --data-binary @- http://192.168.0.183:30008/metrics/job/raspberry_temp/instance/lp-arm-1' > /opt/cron/get_temp.sh

chmod +x /opt/cron/get_temp.sh

#echo '* * * * * /opt/cron/get_temp.sh' > /tmp/cron
#crontab /tmp/cron
