#!/bin/bash

[ -d /etc/salt/master.d ] || mkdir /etc/salt/master.d
[ -f /etc/salt/master ] || cp /root/master /etc/salt/master
[ -f /etc/salt/master.d/default.conf ] || echo user: salt-master >/etc/salt/master.d/default.conf
[ -d /etc/salt/pki ] || mkdir /etc/salt/pki && chown salt-master:salt-master /etc/salt/pki

exec salt-master -c /etc/salt
