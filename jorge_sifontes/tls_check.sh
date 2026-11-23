# Usage Examples

# Example 1
# bash tls_check.sh

# Output:
# * SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384 / X25519 / id-ecPublicKey
# *  subject: CN=example.com
# *  expire date: Dec 25 22:56:35 2026 GMT
# * using HTTP/2
# * [HTTP/2] [1] OPENED stream for https://example.com/
# * [HTTP/2] [1] [:method: HEAD]
# * [HTTP/2] [1] [:scheme: https]
# * [HTTP/2] [1] [:authority: example.com]
# * [HTTP/2] [1] [:path: /]
# * [HTTP/2] [1] [user-agent: curl/8.5.0]
# * [HTTP/2] [1] [accept: */*]
# > HEAD / HTTP/2
# < HTTP/2 200 
# HTTP/2 200 
# subject=CN = example.com
# issuer=C = US, O = SSL Corporation, CN = Cloudflare TLS Issuing ECC CA 3
# notBefore=Sep 26 22:49:11 2026 GMT
# notAfter=Dec 25 22:56:35 2026 GMT
# Certificate will not expire

# Example 2
# bash tls_check.sh youtube.com

# Output:
# * SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384 / X25519 / id-ecPublicKey
# *  subject: CN=*.google.com
# *  expire date: Jan 26 08:26:49 2027 GMT
# * using HTTP/2
# * [HTTP/2] [1] OPENED stream for https://youtube.com/
# * [HTTP/2] [1] [:method: HEAD]
# * [HTTP/2] [1] [:scheme: https]
# * [HTTP/2] [1] [:authority: youtube.com]
# * [HTTP/2] [1] [:path: /]
# * [HTTP/2] [1] [user-agent: curl/8.5.0]
# * [HTTP/2] [1] [accept: */*]
# > HEAD / HTTP/2
# < HTTP/2 301 
# HTTP/2 301 
# subject=CN = *.google.com
# issuer=C = US, O = Google Trust Services, CN = WE2
# notBefore=Nov  3 08:26:50 2026 GMT
# notAfter=Jan 26 08:26:49 2027 GMT
# Certificate will not expire

# Example 3 
# bash tls_check.sh um.dk

# Output:
# * SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384 / X25519 / id-ecPublicKey
# *  subject: CN=um.dk
# *  expire date: Feb  2 05:49:58 2027 GMT
# * using HTTP/2
# * [HTTP/2] [1] OPENED stream for https://um.dk/
# * [HTTP/2] [1] [:method: HEAD]
# * [HTTP/2] [1] [:scheme: https]
# * [HTTP/2] [1] [:authority: um.dk]
# * [HTTP/2] [1] [:path: /]
# * [HTTP/2] [1] [user-agent: curl/8.5.0]
# * [HTTP/2] [1] [accept: */*]
# > HEAD / HTTP/2
# < HTTP/2 200 
# HTTP/2 200 
# subject=CN = um.dk
# issuer=C = US, O = Google Trust Services, CN = WE1
# notBefore=Nov  4 04:52:15 2026 GMT
# notAfter=Feb  2 05:49:58 2027 GMT
# Certificate will not expire

# Example 4
# bash tls_check.sh reddit.com

# Output:
# * SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256 / X25519 / RSASSA-PSS
# *  subject: C=US; ST=California; L=San Francisco; O=Reddit, Inc.; CN=*.reddit.com
# *  expire date: Feb 16 23:59:59 2027 GMT
# * using HTTP/2
# * [HTTP/2] [1] OPENED stream for https://reddit.com/
# * [HTTP/2] [1] [:method: HEAD]
# * [HTTP/2] [1] [:scheme: https]
# * [HTTP/2] [1] [:authority: reddit.com]
# * [HTTP/2] [1] [:path: /]
# * [HTTP/2] [1] [user-agent: curl/8.5.0]
# * [HTTP/2] [1] [accept: */*]
# > HEAD / HTTP/2
# < HTTP/2 301 
# HTTP/2 301 
# subject=C = US, ST = California, L = San Francisco, O = "Reddit, Inc.", CN = *.reddit.com
# issuer=C = US, O = DigiCert Inc, CN = DigiCert Global G2 TLS RSA SHA256 2020 CA1
# notBefore=Aug 21 00:00:00 2026 GMT
# notAfter=Feb 16 23:59:59 2027 GMT
# Certificate will not expire

HOST="${1:-example.com}"

# Ver el handshake TLS y las fechas del certificado
curl -vI "https://www.$HOST" 2>&1 | grep -E "SSL connection|subject:|expire date|HTTP/"

# Inspeccionar emisor y vigencia con openssl
openssl s_client -connect "$HOST:443" -servername $HOST </dev/null 2>/dev/null \
    | openssl x509 -noout -subject -issuer -dates

# ¿Expira en los próximos 30 días? (exit code 1 = sí)
openssl s_client -connect "$HOST:443" -servername $HOST </dev/null 2>/dev/null \
    | openssl x509 -noout -checkend 2592000
