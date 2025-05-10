# bash_scripts
Repository for any and all bash scripts.

## Script Catalog

### OS Installation Scripts
- **debian-12-base-setup.sh**: Sets up a fresh Debian 12 installation with SSH, Docker, and Netplan configurations.
  - Now interactively prompts the user for confirmation before each major step.
  - Includes a `--help` flag to display usage information and a description of each section.

### Automation Scripts
- **create_service_user.sh**: Creates a new service user with a specified username and password.

## Recent Changes
- Updated `os-install/debian-12-base-setup.sh` to be interactive, requiring user confirmation for each step and adding a help flag.
- Reorganized scripts into 'os-install' and 'automations' directories
- Renamed 'fresh-debian-12-install-with-ssh-docker-netplan.sh' to 'debian-12-base-setup.sh' for brevity
