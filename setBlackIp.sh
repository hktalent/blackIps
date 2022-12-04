#!/bin/bash
# https://linux.die.net/man/8/ipset
# variables
ipset=/sbin/ipset
iptables=/sbin/iptables

# Replace with your path to blackip.txt
ips="$1"

# ipset rules
$ipset -L blackip >/dev/null 2>&1
if [ $? -ne 0 ]; then
        echo "set blackip does not exist. create set..."
        $ipset -! create blackip hash:net family inet hashsize 1024 maxelem 10000000
    else
        echo "set blackip exist. flush set..."
        $ipset -! flush blackip
fi
$ipset -! save > /tmp/ipset_blackip.txt
# read file and sort (v8.32 or later)
cat $ips | sort -V -u | while read line; do
    # optional: if there are commented lines
    if [ "${line:0:1}" = "#" ]; then
        continue
    fi
    # adding IPv4 addresses to the tmp list
    echo "add blackip $line" >> /tmp/ipset_blackip.txt
done
# adding the tmp list of IPv4 addresses to the blackip set of ipset
$ipset -! restore < /tmp/ipset_blackip.txt

# iptables rules
$iptables -t mangle -I PREROUTING -m set --match-set blackip src,dst -j DROP
$iptables -I INPUT -m set --match-set blackip src,dst -j DROP
$iptables -I FORWARD -m set --match-set blackip src,dst -j DROP
echo "done"

