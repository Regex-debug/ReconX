#!/bin/bash

# Get the domain from user input
DOMAIN=$1

# Check if the domain is provided, otherwise exit
if [ -z "$DOMAIN" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

echo "==== Resolving Domain with nslookup ===="
nslookup $DOMAIN

echo -e "\n==== WHOIS Lookup ===="
whois $DOMAIN

echo -e "\n==== DNS Information ===="
dig $DOMAIN ANY +noall +answer

echo -e "\n==== SPF Record ===="
dig TXT $DOMAIN +short | grep "spf"

echo -e "\n==== DMARC Record ===="
dig TXT _dmarc.$DOMAIN +short

echo -e "\n==== DKIM Records ===="
dig TXT default._domainkey.$DOMAIN +short

echo -e "\n==== Nameservers (NS) ===="
dig NS $DOMAIN +short

echo -e "\n==== Mail Exchanger (MX) ===="
dig MX $DOMAIN +short

echo -e "\n==== IP Address ===="
dig A $DOMAIN +short

echo -e "\n==== Open Ports and Service Detection via Nmap ===="
nmap -sCTV -Pn $DOMAIN

echo -e "\n==== TLS/SSL Security Scan using testssl ===="
sslscan $DOMAIN

echo -e "\n==== DNS Enumeration with dnsrecon ===="
dnsrecon -d $DOMAIN

echo -e "\n==== Typosquatting and Similar Domains with dnstwist ===="
if command -v dnstwist &> /dev/null; then
    dnstwist --registered $DOMAIN
else
    echo "dnstwist is not installed. Install it using: pip install dnstwist"
fi

echo -e "\n==== Script Execution Completed ===="
