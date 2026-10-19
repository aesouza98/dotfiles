#!/usr/bin/env bash
# TCP check to Cloudflare (ICMP may be blocked)
nc -z -w1 1.1.1.1 443 2>/dev/null && echo "ok" || echo "nok"
