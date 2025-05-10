# bash_scripts
Repository for any and all bash scripts.

## Script Catalog

### OS Installation Scripts
- **debian-12-base-setup.sh**: Sets up a fresh Debian 12 installation with SSH, Docker, and Netplan configurations.
  - Now interactively prompts the user for confirmation before each major step.
  - Includes a `--help` flag to display usage information and a description of each section.

### Automation Scripts
- **create_service_user.sh**: Automates the creation of a dedicated system user and directory structure for running a service (typically a Dockerized application). It prompts for a username and service name, creates the user (with a non-login shell), sets up a service directory in `/opt/service_name`, creates an empty `docker-compose.yaml`, generates a startup script (`start-service_name.sh`), and configures sudoers to allow the new user to run the startup script without a password.

## Recent Changes
- Updated `os-install/debian-12-base-setup.sh` to be interactive, requiring user confirmation for each step and adding a help flag.
- Reorganized scripts into 'os-install' and 'automations' directories
- Renamed 'fresh-debian-12-install-with-ssh-docker-netplan.sh' to 'debian-12-base-setup.sh' for brevity
