source ./templates/support.sh
populate sshd_idle_timeout_value

grep -q ^ClientAliveInterval /etc/ssh/sshd_config && \
  sed -i "s/ClientAliveInterval.*/ClientAliveInterval $sshd_idle_timeout_value/g" /etc/ssh/sshd_config
if ! [ $? -eq 0 ]; then
    echo "ClientAliveInterval $sshd_idle_timeout_value" >> /etc/ssh/sshd_config
fi
