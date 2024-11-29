# Ubuntu Setup Script for Next.js Applications

This repository contains a Bash script to set up a fresh Ubuntu installation with Docker, Docker Compose, Node.js, and all necessary tools to run a Next.js application.

## Features

- Installs and configures Docker and Docker Compose.
- Installs Node.js (LTS) and npm.
- Adds global dependencies for Next.js.
- Prepares the system to deploy a Next.js application using Docker.

## Prerequisites

- Fresh Ubuntu installation (tested on Ubuntu 20.04 and 22.04).
- User with `sudo` privileges.

## Usage

1. **Clone this repository or download the script:**

   ```bash
   git clone https://github.com/your-username/ubuntu-nextjs-setup.git
   cd ubuntu-nextjs-setup
   ```

2. **Make the script executable:**

   ```bash
   chmod +x setup-nextjs.sh
   ```

3. **Run the script with `sudo`:**

   ```bash
   sudo ./setup-nextjs.sh
   ```

4. **Restart your machine after the script finishes:**

   ```bash
   sudo reboot
   ```

## Script Breakdown

The script performs the following steps:

1. **Updates and upgrades system packages.**
2. **Installs essential tools** like `curl`, `git`, and `software-properties-common`.
3. **Installs Docker** and configures it to start on boot.
4. **Installs the latest version of Docker Compose.**
5. **Installs Node.js (LTS) and npm.**
6. **Adds global Next.js dependencies.**
7. **Adds the current user to the `docker` group.**

## Notes

- After running the script, you can deploy your Next.js application using Docker or directly with Node.js.
- If you don't want to restart immediately, log out and log back in to apply the `docker` group changes.
- You can customize the script to fit your specific requirements.

## Contributing

Feel free to fork this repository and submit pull requests to improve the script or add more features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
