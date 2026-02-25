let
  mkXray = json: ''
    #!/bin/sh
    xray run -c ${builtins.toFile "xray-config.json" json} -format=yaml
  '';
  mkSingbox = json: ''
    #!/bin/sh
    sing-box run -c ${builtins.toFile "sing-box-config.json" json}
  '';
  jamesproxies = {
    new-wifi = mkXray ''
      {
        "dns": {
          "hosts": {
            "domain:googleapis.cn": "googleapis.com",
            "dns.alidns.com": [
              "223.5.5.5",
              "223.6.6.6",
              "2400:3200::1",
              "2400:3200:baba::1"
            ],
            "one.one.one.one": [
              "1.1.1.1",
              "1.0.0.1",
              "2606:4700:4700::1111",
              "2606:4700:4700::1001"
            ],
            "dns.cloudflare.com": [
              "104.16.132.229",
              "104.16.133.229",
              "2606:4700::6810:84e5",
              "2606:4700::6810:85e5"
            ],
            "cloudflare-dns.com": [
              "104.16.248.249",
              "104.16.249.249",
              "2606:4700::6810:f8f9",
              "2606:4700::6810:f9f9"
            ],
            "dot.pub": [
              "1.12.12.12",
              "120.53.53.53"
            ],
            "dns.google": [
              "8.8.8.8",
              "8.8.4.4",
              "2001:4860:4860::8888",
              "2001:4860:4860::8844"
            ],
            "dns.quad9.net": [
              "9.9.9.9",
              "149.112.112.112",
              "2620:fe::fe",
              "2620:fe::9"
            ],
            "common.dot.dns.yandex.net": [
              "77.88.8.8",
              "77.88.8.1",
              "2a02:6b8::feed:0ff",
              "2a02:6b8:0:1::feed:0ff"
            ]
          },
          "servers": [
            "1.1.1.1"
          ]
        },
        "inbounds": [
          {
            "port": 1080,
            "protocol": "socks",
            "settings": {
              "auth": "noauth",
              "udp": true,
              "userLevel": 8
            },
            "sniffing": {
              "destOverride": [
                "http",
                "tls"
              ],
              "enabled": true,
              "routeOnly": false
            },
            "tag": "socks"
          }
        ],
        "log": {
          "loglevel": "warning"
        },
        "outbounds": [
          {
            "mux": {
              "concurrency": -1,
              "enabled": false
            },
            "protocol": "vless",
            "settings": {
              "vnext": [
                {
                  "address": "104.18.32.47",
                  "port": 2053,
                  "users": [
                    {
                      "encryption": "none",
                      "id": "2282ae6a-76ff-4de2-a562-2717a75b1886",
                      "level": 8
                    }
                  ]
                }
              ]
            },
            "streamSettings": {
              "network": "ws",
              "security": "tls",
              "tlsSettings": {
                "allowInsecure": false,
                "alpn": [
                  "h2",
                  "http/1.1"
                ],
                "fingerprint": "chrome",
                "serverName": "dl.sonrassblue.shop",
                "show": false
              },
              "wsSettings": {
                "headers": {
                  "Host": "dl.sonrassblue.shop"
                },
                "path": "/uUzI4buuT"
              }
            },
            "tag": "proxy"
          },
          {
            "protocol": "freedom",
            "settings": {
              "domainStrategy": "UseIP"
            },
            "tag": "direct"
          },
          {
            "protocol": "blackhole",
            "settings": {
              "response": {
                "type": "http"
              }
            },
            "tag": "block"
          }
        ],
        "policy": {
          "levels": {
            "8": {
              "connIdle": 300,
              "downlinkOnly": 1,
              "handshake": 4,
              "uplinkOnly": 1
            }
          },
          "system": {
            "statsOutboundUplink": true,
            "statsOutboundDownlink": true
          }
        },
        "remarks": "new wifi",
        "routing": {
          "domainStrategy": "AsIs",
          "rules": [
            {
              "ip": [
                "8.8.8.8"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "1.1.1.1"
              ],
              "outboundTag": "proxy",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "223.5.5.5"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            }
          ]
        },
        "stats": {}
      }
    '';
    cf-https = mkXray ''
      {
        "dns": {
          "hosts": {
            "domain:googleapis.cn": "googleapis.com",
            "dns.alidns.com": [
              "223.5.5.5",
              "223.6.6.6",
              "2400:3200::1",
              "2400:3200:baba::1"
            ],
            "one.one.one.one": [
              "1.1.1.1",
              "1.0.0.1",
              "2606:4700:4700::1111",
              "2606:4700:4700::1001"
            ],
            "dns.cloudflare.com": [
              "104.16.132.229",
              "104.16.133.229",
              "2606:4700::6810:84e5",
              "2606:4700::6810:85e5"
            ],
            "cloudflare-dns.com": [
              "104.16.248.249",
              "104.16.249.249",
              "2606:4700::6810:f8f9",
              "2606:4700::6810:f9f9"
            ],
            "dot.pub": [
              "1.12.12.12",
              "120.53.53.53"
            ],
            "dns.google": [
              "8.8.8.8",
              "8.8.4.4",
              "2001:4860:4860::8888",
              "2001:4860:4860::8844"
            ],
            "dns.quad9.net": [
              "9.9.9.9",
              "149.112.112.112",
              "2620:fe::fe",
              "2620:fe::9"
            ],
            "common.dot.dns.yandex.net": [
              "77.88.8.8",
              "77.88.8.1",
              "2a02:6b8::feed:0ff",
              "2a02:6b8:0:1::feed:0ff"
            ]
          },
          "servers": [
            "1.1.1.1"
          ]
        },
        "inbounds": [
          {
            "listen": "127.0.0.1",
            "port": 1080,
            "protocol": "socks",
            "settings": {
              "auth": "noauth",
              "udp": true,
              "userLevel": 8
            },
            "sniffing": {
              "destOverride": [
                "http",
                "tls"
              ],
              "enabled": true,
              "routeOnly": false
            },
            "tag": "socks"
          }
        ],
        "log": {
          "loglevel": "warning"
        },
        "outbounds": [
          {
            "mux": {
              "concurrency": -1,
              "enabled": false
            },
            "protocol": "vless",
            "settings": {
              "vnext": [
                {
                  "address": "104.18.32.47",
                  "port": 2053,
                  "users": [
                    {
                      "encryption": "none",
                      "id": "31f51572-9ec8-40cc-b764-2a0fbf670740",
                      "level": 8
                    }
                  ]
                }
              ]
            },
            "streamSettings": {
              "network": "ws",
              "security": "tls",
              "tlsSettings": {
                "allowInsecure": true,
                "fingerprint": "firefox",
                "serverName": "docs.paya.dev",
                "show": false
              },
              "wsSettings": {
                "headers": {
                  "Host": ""
                },
                "path": "/"
              }
            },
            "tag": "proxy"
          },
          {
            "protocol": "freedom",
            "settings": {
              "domainStrategy": "UseIP"
            },
            "tag": "direct"
          },
          {
            "protocol": "blackhole",
            "settings": {
              "response": {
                "type": "http"
              }
            },
            "tag": "block"
          }
        ],
        "policy": {
          "levels": {
            "8": {
              "connIdle": 300,
              "downlinkOnly": 1,
              "handshake": 4,
              "uplinkOnly": 1
            }
          },
          "system": {
            "statsOutboundUplink": true,
            "statsOutboundDownlink": true
          }
        },
        "remarks": "cf-https",
        "routing": {
          "domainStrategy": "AsIs",
          "rules": [
            {
              "ip": [
                "8.8.8.8"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "1.1.1.1"
              ],
              "outboundTag": "proxy",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "223.5.5.5"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            }
          ]
        },
        "stats": {}
      }
    '';
    cf-http = mkXray ''
      {
        "dns": {
          "hosts": {
            "domain:googleapis.cn": "googleapis.com",
            "dns.alidns.com": [
              "223.5.5.5",
              "223.6.6.6",
              "2400:3200::1",
              "2400:3200:baba::1"
            ],
            "one.one.one.one": [
              "1.1.1.1",
              "1.0.0.1",
              "2606:4700:4700::1111",
              "2606:4700:4700::1001"
            ],
            "dns.cloudflare.com": [
              "104.16.132.229",
              "104.16.133.229",
              "2606:4700::6810:84e5",
              "2606:4700::6810:85e5"
            ],
            "cloudflare-dns.com": [
              "104.16.248.249",
              "104.16.249.249",
              "2606:4700::6810:f8f9",
              "2606:4700::6810:f9f9"
            ],
            "dot.pub": [
              "1.12.12.12",
              "120.53.53.53"
            ],
            "dns.google": [
              "8.8.8.8",
              "8.8.4.4",
              "2001:4860:4860::8888",
              "2001:4860:4860::8844"
            ],
            "dns.quad9.net": [
              "9.9.9.9",
              "149.112.112.112",
              "2620:fe::fe",
              "2620:fe::9"
            ],
            "common.dot.dns.yandex.net": [
              "77.88.8.8",
              "77.88.8.1",
              "2a02:6b8::feed:0ff",
              "2a02:6b8:0:1::feed:0ff"
            ]
          },
          "servers": [
            "1.1.1.1"
          ]
        },
        "inbounds": [
          {
            "listen": "127.0.0.1",
            "port": 1080,
            "protocol": "socks",
            "settings": {
              "auth": "noauth",
              "udp": true,
              "userLevel": 8
            },
            "sniffing": {
              "destOverride": [
                "http",
                "tls"
              ],
              "enabled": true,
              "routeOnly": false
            },
            "tag": "socks"
          }
        ],
        "log": {
          "loglevel": "warning"
        },
        "outbounds": [
          {
            "mux": {
              "concurrency": -1,
              "enabled": false
            },
            "protocol": "vless",
            "settings": {
              "vnext": [
                {
                  "address": "104.18.32.47",
                  "port": 2086,
                  "users": [
                    {
                      "encryption": "none",
                      "id": "31f51572-9ec8-40cc-b764-2a0fbf670740",
                      "level": 8
                    }
                  ]
                }
              ]
            },
            "streamSettings": {
              "network": "ws",
              "wsSettings": {
                "headers": {
                  "Host": "docs.paya.dev"
                },
                "path": "/"
              }
            },
            "tag": "proxy"
          },
          {
            "protocol": "freedom",
            "settings": {
              "domainStrategy": "UseIP"
            },
            "tag": "direct"
          },
          {
            "protocol": "blackhole",
            "settings": {
              "response": {
                "type": "http"
              }
            },
            "tag": "block"
          }
        ],
        "policy": {
          "levels": {
            "8": {
              "connIdle": 300,
              "downlinkOnly": 1,
              "handshake": 4,
              "uplinkOnly": 1
            }
          },
          "system": {
            "statsOutboundUplink": true,
            "statsOutboundDownlink": true
          }
        },
        "remarks": "cf-http",
        "routing": {
          "domainStrategy": "AsIs",
          "rules": [
            {
              "ip": [
                "8.8.8.8"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "1.1.1.1"
              ],
              "outboundTag": "proxy",
              "port": "53",
              "type": "field"
            },
            {
              "ip": [
                "223.5.5.5"
              ],
              "outboundTag": "direct",
              "port": "53",
              "type": "field"
            }
          ]
        },
        "stats": {}
      }
    '';
    ourslip = ''
      cert=$(mktemp cert.XXXXXXXXXX.pam)

      # Trap to clean up child processes on exit
      trap 'kill $slipstream_pid $singbox_pid 2>/dev/null; rm -f "$cert" "$cfg"; exit' EXIT INT TERM HUP
      (cat <<EOF
      -----BEGIN CERTIFICATE-----
      MIIDCzCCAfOgAwIBAgIUPsaasxKEg0NK22++6dNHw81+YLYwDQYJKoZIhvcNAQEL
      BQAwFTETMBEGA1UEAwwKc2xpcHN0cmVhbTAeFw0yNjAxMjQxNjUyMDVaFw0yNzAx
      MjQxNjUyMDVaMBUxEzARBgNVBAMMCnNsaXBzdHJlYW0wggEiMA0GCSqGSIb3DQEB
      AQUAA4IBDwAwggEKAoIBAQC3/5IxeYWeeB2FSDAKBXo+C4sv075BH4cb6U+XJBI2
      BzLe/JmSxcuJyHXmFHcs5fMRN9lz/kreemklxe9w1fFSUfxSWNra0ytRJOH1KuN+
      J61gb9wRu8LV59Pxem2QRa5pCN7kpHpLTm5DmEmBBkxDFK+2kyWlDJaY9dQAYy9Q
      /95y9dRCWLZz+BDZTMp4a88COWFmTP6zcypXEge7dA+1rKAKJTwUCVEdjnhn82+L
      P9AzOJo9pHDnDUTKrVtP/ohGjya9DvmNqd2SRNoltkcCRheiZwkuFSryg3SA5exf
      xJVyNQSyehj6uD1he+61/MvpnoXIpVALiX5kLrbOtYnXAgMBAAGjUzBRMB0GA1Ud
      DgQWBBTulP9njSS624wTJMaCcWBAPyEd9jAfBgNVHSMEGDAWgBTulP9njSS624wT
      JMaCcWBAPyEd9jAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBx
      z2yrLEngu2qnQayZB7lcdho9tm642Ftr+FHUD2LeZ6gHoTm0i6KK6YRa24hmTG+i
      sQRaXUe27Il24qfJ5PdaK/lC3yE1u6T5ujhyh/cH3HzUkLRrdrPxL2nVbjc5J9En
      fFQojIPwZPvedDYz5RuS/tWUE93XOJ3uoG6QUQ7rhwGbVxL8UhpMiXwNfan3pzQH
      WOFcj+6dle2pTHs5L9EX+IEH5CnSs8zWRiwRnJhNl66r4b48DkIDjmxYUNEG/+7l
      t3/mW0S/y8BR0rHYhCb80Y0U/oxBOcPbvy9aYwj0eQJ+CKaOlceUSYa88hhgyNPm
      TEVUU/Zquz/UIEubK4pD
      -----END CERTIFICATE-----
      EOF
      )> "$cert";


      slipstream-client --tcp-listen-port 8080 --resolver 185.228.169.9:53 --domain d.softdown.ir --cert "$cert" &
      slipstream_pid=$!

      cfg=$(mktemp sing-box.XXXXXXXXXX.json)

      (cat <<EOF
      {
        "log": {
          "disabled": true
        },
        "inbounds": [
          {
            "type": "mixed",
            "listen": "127.0.0.1",
            "listen_port": 1080
          },
          {
            "type": "socks",
            "listen": "127.0.0.1",
            "listen_port": 1081
          }
        ],
        "outbounds": [
          {
            "type": "ssh",
            "server": "127.0.0.1",
            "server_port": 8080,
            "user": "web",
            "password": "R7ZTqjWmLs14CAJYD37y"
          }
        ]
      }
      EOF
      )> "$cfg";


      sing-box run -c "$cfg" &
      singbox_pid=$!

      wait
    '';
  };
in
rec {
  location = {
    longitude = 59.2207071;
    latitude = 35.3411353;
  };
  taskwarrior-secret = "223";
  awg-config = "";
  proxies = jamesproxies;
  defaultProxy = "new-wifi";
  proxy = proxies.new-wifi;
  openvpn = "";
  GROQ_API_KEY = "gsk_";

  OPENAI_API_KEY = OPENROUTER_API_KEY;
  OPENROUTER_API_KEY = "sk-or-v1";
  OPENAI_API_HOST = "https://openrouter.ai/api/v1";
  ANTHROPIC_AUTH_TOKEN = "28470eaee2ae4d50bb20a312f7855806.yjivU1p6HTrN1Mqt";
  ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic";
  NOTIFIER_BOT_TOKEN = "7250309186:AAEzH_6ag48zZmzlfEtrqxUS6vrIALpuWC4";
  CHAT_ID = "6116330098";
  HASHED_PASSWORD = "$y$j9T$LXk.xP930CF4y/vhlGr0b0$gsAxTJh/vt8PjiZwKFpX/SgIAYK08vuiZKrZnpmBK73";

}
