apt install -yy wget git
curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1 >ip1.txt
curl --compressed http://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt  2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$">>ip1.txt
wget=`which wget`
# $wget -q -N -c https://github.com/T145/black-mirror/releases/download/latest/black_domain.txt
$wget -q -N -c https://github.com/T145/black-mirror/releases/download/latest/black_ipv4.txt
$wget -q -N -c https://github.com/T145/black-mirror/releases/download/latest/black_ipv4_cidr.txt
$wget -q -N -c https://github.com/T145/black-mirror/releases/download/latest/black_ipv6.txt
$wget -q -N -c https://raw.githubusercontent.com/maravento/blackip/master/blackip.tar.gz && cat blackip.tar.gz* | tar xzf -
cat blackip.txt black_ipv4.txt black_ipv4_cidr.txt black_ipv6.txt >>ip1.txt
rm -rf blackip.txt blackip.tar.gz black_ipv4.txt black_ipv4_cidr.txt black_ipv6.txt
sort -u ip1.txt >ip2.txt;mv ip2.txt ip1.txt
wc -l ip1.txt


# https://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
# https://www.ipdeny.com/ipv6/ipaddresses/blocks/ipv6-all-zones.tar.gz