FROM ubuntu:16.04
MAINTAINER Matt Willsher <matt@willsher.systems>

# Update system
# TODO: Merge with below apt
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold \
  && apt-get install -y wget

# Update System
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - \
 && echo deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main >/etc/apt/sources.list.d/saltstack.list \
 && apt-get update && apt-get install -y salt-minion dmidecode salt-master salt-api && mkdir /etc/salt/pki

#Work around https://github.com/saltstack/salt/issues/33175 with /var/run permissions
RUN useradd -c "salt-master" -r salt-master  && chown salt-master /var/run 
 
# Volumes

VOLUME [ "/var/cache/salt", "/var/log/salt", "/etc/salt" ]

# Add Run File

ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Ports

EXPOSE 4505 4506

# Run Command

CMD "/usr/local/bin/start.sh"