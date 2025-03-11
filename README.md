# ReconX
Domain Information and Security Scanner
Author: Regex-debug

This script gathers domain-related information and performs various security checks, including:

1. Resolving the domain using nslookup.
2. Performing a WHOIS lookup to get domain registration details.
3. Retrieving all DNS records using dig.
4. Checking the SPF record to verify email authentication policies.
5. Checking the DMARC record for email security policies.
6. Checking DKIM records for domain-based email authentication.
7. Retrieving Nameserver (NS) records to find authoritative DNS servers.
8. Retrieving Mail Exchanger (MX) records to identify the domain's mail servers.
9. Retrieving the A record to find the IPv4 address of the domain.
10. Scanning for open ports and running services using Nmap.
11. Performing an SSL/TLS security scan using sslscan.
12. Running DNS enumeration using dnsrecon to find subdomains.
13. Checking for typosquatting and similar domains using dnstwist.

# Usage: ./script.sh <domain>
Example: ./script.sh example.com

