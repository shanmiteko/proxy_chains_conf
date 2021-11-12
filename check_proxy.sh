#!/bin/sh

if [[ -n $1 ]]
then
	file=$1
else
	echo "Usage: $0 <file.txt>"
	exit 0
fi

test_url="https://api.bilibili.com/client_info"
alias parse_json='jq ".data .ip"'

real_ip=$(curl --connect-timeout 3 -fs $test_url | parse_json)
# echo "#real_ip:$real_ip"

# ProxyChains4 proxychains.conf
# echo "round_robin_chain"
echo "random_chain"
echo "chain_len = 1"
echo "[ProxyList]"
# ProxyChains4 proxychains.conf

while read line
do {
	client_info=$(curl -x http://$line --connect-timeout 3 -fs $test_url)
	if [[ -n $client_info ]]
	then
		ip=$(echo $client_info | parse_json)
		ip_port=$(echo $line | tr ":" "\t")
		printf "http\t$ip_port\t#now:$ip\n"
	fi
} &
done < $file
wait
