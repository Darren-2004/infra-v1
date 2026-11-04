#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

# Update system and install Nginx + UFW
apt-get update -y
apt-get install -y nginx ufw

# Deploy home page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Infrastructure V1 - Web Server</title>
</head>
<body>
    <h1>Infrastructure V1 - Web Server</h1>
    <p>Server IP: 192.168.56.10</p>
    <p>Status: Active (Nginx)</p>
</body>
</html>
EOF

systemctl enable nginx
systemctl restart nginx

# Firewall Setup (UFW)
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 80/tcp
ufw --force enable