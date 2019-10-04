#!/usr/bin/env bash
set -euo pipefail

source .config

read -p "Username: " USERNAME
read -s -p "Password (will not be echoed):" PASSWORD

RESP=$(curl \
    -XPOST \
    $INSTANCE_URL/api/v1/apps \
    --data-urlencode 'client_name=fedibash' \
    --data-urlencode 'redirect_uris=urn:ietf:wg:oauth:2.0:oob' \
    --data-urlencode 'scopes=read write follow' \
    --header "Content-Type: application/x-www-form-urlencoded")

client_id=$(echo $RESP | jq .client_id | sed "s|\"||g")
client_secret=$(echo $RESP | jq .client_secret | sed "s|\"||g")

RESP=$(curl \
    -XPOST \
    $INSTANCE_URL/oauth/token \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "client_id=$client_id" \
    --data-urlencode "client_secret=$client_secret" \
    --data-urlencode "username=$USERNAME" \
    --data-urlencode "password=$PASSWORD" \
    --data-urlencode "grant_type=password" \
    --data-urlencode "scope=read write follow"
)

access_token="Bearer $(echo $RESP | jq .access_token | sed "s|\"||g")"
echo "ACCESS_TOKEN=\"$access_token\"" >> .config
echo "Logged $USERNAME in!"
