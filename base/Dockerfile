FROM debian:jessie
MAINTAINER Matt Willsher <matt@willsher.systems>

run apt-get update && apt-get upgrade -y -o dpkg::options::=--force-confold \
  && apt-get install -y wget \
  && wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - \
  && echo deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main >/etc/apt/sources.list.d/saltstack.list \
  && apt-get update && apt-get install -y dmidecode salt-api salt-doc salt-master salt-minion salt-syndic salt-cloud salt-ssh \
  && mkdir /etc/salt/pki \
  && useradd -c "salt-master" -r salt-master \
  && chown salt-master /var/run \
  && cp -r /etc/salt /etc/salt.dist

VOLUME [ "/var/cache/salt", "/var/log/salt", "/etc/salt", "/var/run/salt" ]

ONBUILD COPY start.sh /usr/local/bin/start.sh
ONBUILD RUN chmod +x /usr/local/bin/start.sh || true
ONBUILD CMD [ "/usr/local/bin/start.sh" ]
