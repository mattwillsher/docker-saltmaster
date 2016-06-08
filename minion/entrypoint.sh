#!/bin/bash

[ -d /etc/salt/minion.d ] || mkdir /etc/salt/minion.d
[ -f /etc/salt/minion ] || cp /root/minion /etc/salt/minion
[ -f /etc/salt/minion.d/default.conf ] || echo master: ${master} >/etc/salt/minion.d/default.conf

exec salt-minion -c /etc/salt $*
