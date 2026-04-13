#!/bin/bash
# UFW firewall setup for homecloud home server
# Run with: sudo bash ufw-rules.sh
# Change 2299 to your custom SSH port if different

set -e

echo "Setting up UFW firewall..."

# Default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# SSH (custom port)
sudo ufw allow 2299/tcp comment 'SSH custom port'

# Nextcloud (local network only)
sudo ufw allow 8888/tcp comment 'Nextcloud'

# Samba (local network)
sudo ufw allow 137/udp comment 'Samba NetBIOS'
sudo ufw allow 138/udp comment 'Samba NetBIOS'
sudo ufw allow 139/tcp comment 'Samba'
sudo ufw allow 445/tcp comment 'Samba'

# Tailscale interface - allow all
sudo ufw allow in on tailscale0 comment 'Tailscale'

# Enable
sudo ufw --force enable

echo "UFW configured. Current rules:"
sudo ufw status verbose
