# homecloud

Build your own personal cloud on an old laptop. Replace Google Drive, auto-backup photos, and access your files from anywhere — for almost nothing.

## What this is

A complete guide to building a self-hosted personal cloud using free and open-source software. Runs on any old laptop or mini PC.

**Stack:** Ubuntu Server 24.04 · Docker · Nextcloud · Samba · Tailscale · Oracle Free VPS · frp · Cloudflare · UFW · Fail2Ban

## Blog series

This repo is the companion to a 5-part tutorial series:

| Part | Topic | Status |
|------|-------|--------|
| 1 | [Overview & Architecture](LINK_TO_PART_1) | ✅ Published |
| 2 | [Nextcloud + Docker Setup](LINK_TO_PART_2) | ✅ Published |
| 3 | NAS with Samba | ✅ Published |
| 4 | Remote Access (Tailscale + VPS + frp) | ✅ Published |
| 5 | Security Hardening | ✅ Published  |

## Quick start

```bash
# Clone this repo
git clone https://github.com/sasrath/homecloud.git
cd homecloud

# Prepare storage
sudo mkdir -p /srv/nas/{photos,videos,documents,nextcloud}
sudo chown -R www-data:www-data /srv/nas

# Launch Nextcloud
docker compose up -d
```

Then open `http://your-server-ip:8888` in a browser.

## Repo structure

```
homecloud/
├── README.md
├── docker-compose.yml          ← Nextcloud container config
├── samba/
│   └── smb.conf                ← NAS file sharing config (Part 3)
├── frp/
│   ├── frpc.toml               ← Home server tunnel client (Part 4)
│   └── frps.toml               ← VPS tunnel server (Part 4)
├── nginx/
│   └── nextcloud.conf          ← Reverse proxy config (Part 4)
└── security/
    ├── ufw-rules.sh            ← Firewall setup script (Part 5)
    └── fail2ban-jail.local     ← Brute force protection (Part 5)
    └── nextcloud-filter.conf     ← Brute force protection (Part 5)
```

## Requirements

- Any x86 laptop or mini PC (4GB+ RAM recommended)
- Ubuntu Server 24.04 LTS
- Internet connection
- A domain name (~₹850/year) for remote access

## Cost

| Item | Cost |
|------|------|
| Domain name | ~₹850/year |
| Oracle VPS | Free forever |
| Cloudflare | Free |
| Tailscale | Free |
| All software | Free & open source |
| **Total** | **~₹850/year + electricity** |

## License

MIT — use however you like.
