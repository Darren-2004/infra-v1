#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

# Update system and install PostgreSQL + UFW
apt-get update -y
apt-get install -y postgresql postgresql-contrib ufw

# Configure PostgreSQL to listen on private network
PG_VER=$(ls /etc/postgresql/)
PG_CONF="/etc/postgresql/$PG_VER/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VER/main/pg_hba.conf"

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" "$PG_CONF"
echo "host    all             all             192.168.56.10/32         md5" >> "$PG_HBA"

systemctl restart postgresql

# Create database and user
sudo -u postgres psql -c "CREATE USER appuser WITH PASSWORD 'securepassword';"
sudo -u postgres psql -c "CREATE DATABASE appdb OWNER appuser;"

# Firewall Setup: Allow port 5432 ONLY from web server (192.168.56.10)
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow from 192.168.56.10 to any port 5432 proto tcp
ufw --force enable