#!/bin/bash

# set path to authorized_keys
file=/home/${user}/.ssh/authorized_keys

# create the authorized_keys (public keys for all allowed users)
cat > $file <<EOF
${authorized_keys}
EOF

# set file owner/permissions
chown ${user}:${user} $file
chmod 600 $file

# set cluster name for the ecs agent
echo ECS_CLUSTER=${cluster_name} > /etc/ecs/ecs.config
