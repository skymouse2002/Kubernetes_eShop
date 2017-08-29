#!/bin/bash

sed -i 's#host:.*#host: '"$REDIS_HOST"'#g' application.yml
portstr=`cat application.yml | grep -A2 redis | grep port`
sed -i 's#'"$portstr"'#    port: '"$REDIS_PORT"'#g' application.yml
cat application.yml
java -jar /opt/app/eshop_service/eshop_k8s_eshop_web.jar --spring.config.location=/opt/app/eshop_service/application.yml
