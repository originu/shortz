#!/bin/sh
export ECS_INSTANCE_IP_TASK=$(curl --retry 5 -connect-timeout 3 -s ${ECS_CONTAINER_METADATA_URI})
export ECS_INSTANCE_HOSTNAME=$(cat /proc/sys/kernel/hostname)
export ECS_INSTANCE_IP_ADDRESS=$(echo ${ECS_INSTANCE_IP_TASK} | python3 -c "import sys, json; print(json.load(sys.stdin)['Networks'][0]['IPv4Addresses'][0])")
echo "${ECS_INSTANCE_IP_ADDRESS} ${ECS_INSTANCE_HOSTNAME}" | tee -a /etc/hosts
echo "ECS_INSTANCE_HOSTNAME: " ${ECS_INSTANCE_HOSTNAME}
echo "ECS_INSTANCE_IP_ADDRESS: " ${ECS_INSTANCE_IP_ADDRESS}
echo java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar --spring.profiles.active=dev
exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar --spring.profiles.active=dev