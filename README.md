# Linux Web Stack with CI/CD

A production-ready web server setup featuring a Python Flask application, containerized with Docker, managed by Systemd, and served via Nginx reverse proxy. Includes a fully automated CI/CD pipeline using GitHub Actions and a self-hosted runner.

## Architecture



* **Application:** Python Flask (v3.12)
* **Containerization:** Docker
* **Web Server:** Nginx (Reverse Proxy)
* **Process Manager:** Systemd
* **Security:** UFW Firewall (SSH & Nginx only)
* **CI/CD:** GitHub Actions (Self-Hosted Runner)

## Project Structure

```text
webstack-project/
├── src/                # Python application source code
│   └── app.py          # Flask entry point
├── nginx/              # Web server configuration
│   └── webstack.conf   # Nginx reverse proxy rules
├── systemd/            # Service management
│   └── webstack.service
├── Dockerfile          # Container build instructions
├── README.md           # Documentation
└── .github/workflows/  # CI/CD Automation scripts
```

## How it Works
Traffic Flow: User requests -> Port 80 (Nginx) -> Port 5000 (Docker Container).

Automation:

Push code to master branch.

GitHub Runner on the server detects changes.

Runner rebuilds the Docker image.

Runner restarts the Systemd service automatically.

## Deployment Commands
Commands used to build the stack manually:

Bash```
# Build the image
docker build -t webstack-project .

# Run the container manually
docker run -d -p 5000:5000 webstack-project

# Check status
sudo systemctl status webstack.service
```

## Security Measures
UFW Firewall: Active. Allows only OpenSSH (22) and Nginx Full (80).

Sudo Privileges: The CI/CD runner has restricted NOPASSWD access only for restarting the specific service.
