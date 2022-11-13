#!/bin/bash
ips=$(cat ./config/iplist | sed 1d)

for ip in $ips
do
    java -cp "tsunami.jar:plugins/*" "-Dtsunami-config.location=tsunami.yaml" \
    "com.google.tsunami.main.cli.TsunamiCli" --ip-v4-target=$ip --scan-results-local-output-format=JSON \
    --scan-results-local-output-filename=logs/tsunami-output-$ip.json
done            



