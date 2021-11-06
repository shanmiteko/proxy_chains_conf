#!/bin/bash

LIST_FILE=proxy_list.txt
HTTP_PROXY_LISTS=(
	"https://raw.fastgit.org/monosans/proxy-list/main/proxies/http.txt"
	"https://raw.fastgit.org/jetkai/proxy-list/main/online-proxies/txt/proxies-http.txt"
	"https://raw.fastgit.org/TheSpeedX/PROXY-List/master/http.txt"
	"https://raw.fastgit.org/roosterkid/openproxylist/main/HTTPS_RAW.txt"
)

cat /dev/null > $LIST_FILE

for HTTP_PROXY_LIST in ${HTTP_PROXY_LISTS[@]}; do
	echo "-> $HTTP_PROXY_LIST"
	curl -sL $HTTP_PROXY_LIST >> $LIST_FILE
	echo "<- $HTTP_PROXY_LIST"
done
