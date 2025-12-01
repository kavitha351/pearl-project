#!/bin/bash
# Log all output to /var/log/user-data.log
exec > /var/log/user-data.log 2>&1

sudo apt-get update -y

# Basic tools
sudo apt-get install -y curl git ufw

# Install Node.js 20 (Strapi requirement)
sudo curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
sudo apt-get install -y nodejs build-essential

# Install PostgreSQL (local DB)
sudo apt-get install -y postgresql postgresql-contrib

# Create DB + user for Strapi
sudo sudo -u postgres psql <<EOF
CREATE USER strapiuser WITH PASSWORD 'StrapiPass123!';
CREATE DATABASE strapidb OWNER strapiuser;
ALTER ROLE strapiuser SET client_encoding TO 'utf8';
ALTER ROLE strapiuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE strapiuser SET timezone TO 'UTC';
EOF

# Install PM2 to run Strapi in background later
sudo npm install -g pm2

# Install Nginx (for reverse proxy if you want)
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Allow HTTP via UFW if you use it (optional, SG already allows it)
sudo ufw allow 80/tcp || true
sudo ufw allow 1337/tcp || true

echo "Bootstrap finished." 