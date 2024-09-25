#!/bin/bash

get_jwks_uri_host() {
    # usually static but let's follow the protocol
    local openid_config_url="https://token.actions.githubusercontent.com/.well-known/openid-configuration"
    curl --silent "$openid_config_url" | jq -r '.jwks_uri | split("/")[2]'
}

get_cert_fingerprint() {
    local host="$1"
    echo | openssl s_client -servername "$host" -showcerts -connect "$host:443" 2>/dev/null |
        sed -n -e '/BEGIN/h' -e '/BEGIN/,/END/H' -e '$x' -e '$p' |
        tail +2 |
        openssl x509 -fingerprint -noout |
        sed -e "s/.*=//" -e "s/://g" |
        tr '[:upper:]' '[:lower:]'
}

main() {
    local host
    host=$(get_jwks_uri_host)
    get_cert_fingerprint "$host"
}

main