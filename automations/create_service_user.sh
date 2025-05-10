#!/bin/bash

# Check if running with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Prompt for user name
read -p "Please enter the name of the user who will run the service: " user_name
user_name=${user_name:-$service_name}

# Prompt for service name
read -p "Please enter the name of the service (NOTE: a directory will be created in /opt with the name you enter): " service_name

# Create the user
echo "Creating user '$user_name'..."
useradd -r -s /bin/false "$user_name"
id "$user_name"
echo "User '$user_name' created successfully."

# Create directories
echo "Creating directory for '$service_name'..."
mkdir -p "/opt/$service_name"
chown -R "$user_name:$user_name" "/opt/$service_name"
echo "Directories created successfully."

# Set permissions
echo "Setting permissions for '$service_name'..."
chmod -R 750 "/opt/$service_name"
usermod -aG docker "$user_name"
echo "Permissions set successfully."

# Create docker-compose.yaml
echo "Creating docker-compose.yaml for '$service_name'..."
touch /opt/$service_name/docker-compose.yaml
chown "$user_name:$user_name" "/opt/$service_name/docker-compose.yaml"
echo "docker-compose.yaml created successfully."

# Create startup script
echo "Creating startup script for '$service_name'..."
tee "/opt/$service_name/start-$service_name.sh" > /dev/null << EOF
#!/bin/bash
cd "/opt/$service_name"
docker compose up -d
EOF
chmod +x "/opt/$service_name/start-$service_name.sh"
chown "$user_name:$user_name" "/opt/$service_name/start-$service_name.sh"
echo "Startup script created successfully."

# Additional security measures
echo "Adding additional security measures for '$service_name'..."
echo "$user_name ALL= NOPASSWD: /opt/$service_name/start-$service_name.sh" | sudo EDITOR='tee -a' visudo
echo "Security measures added successfully."
