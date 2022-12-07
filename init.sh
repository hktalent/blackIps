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
tar -czvf blackIpList.tar.gz ip1.txt
ls -lah blackIpList.tar.gz
rm -rf ip1.txt
git add blackIpList.tar.gz

wget -c -O bug-bounty-dorks.txt https://raw.githubusercontent.com/sushiwushi/bug-bounty-dorks/master/dorks.txt
git add bug-bounty-dorks.txt

# wget -c -O shodan-dorks.md 'https://raw.githubusercontent.com/lothos612/shodan/main/Shodan%20Dorks.jex'
wget -c -O shodan-dorks.md 'https://raw.githubusercontent.com/lothos612/shodan/main/README.md'
git add shodan-dorks.md
wget -c -O github-dorks.txt https://raw.githubusercontent.com/techgaun/github-dorks/master/github-dorks.txt
git add github-dorks.txt
wget -c -O google_Dorks.txt https://raw.githubusercontent.com/BullsEye0/google_dork_list/master/google_Dorks.txt
git add google_Dorks.txt

wget -c -O movie_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/movie.txt
wget -c -O onion_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/onion.txt
wget -c -O aws_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/aws.txt
wget -c -O azure_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/azure.tx
wget -c -O cctv_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/cctv.txt
wget -c -O googslecloud_Dorks.txt https://raw.githubusercontent.com/cipher387/Dorks-collections-list/main/googslecloud.txt
git add azure_Dorks.txt aws_Dorks.txt cctv_Dorks.txt googslecloud_Dorks.txt movie_Dorks.txt onion_Dorks.txt

# https://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
# https://www.ipdeny.com/ipv6/ipaddresses/blocks/ipv6-all-zones.tar.gz
