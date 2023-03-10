#!/bin/bash

subfinder -d $1 -o subdomains.txt | httprobe -c 50 -t 1000 | wfuzz -w wordlist.txt -c -u 'https://$1' -H 'X-Forwarded-For: FUZZ' -v --hc 404 | grep -e "code-200" | awk '{print $5) | grep -E '.php.asp.jsp' | hakcheckurl -verbose 
| grep -E 'high|medium' | sort -u > vuln_url.txt
