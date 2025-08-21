# Pizzaria Deploy

This repository contains the **deployment script** for the [Pizzaria Application](https://github.com/spttleonardo/proway-docker-pizzaria).  
The goal is to install and update the application automatically on any Linux server.

---

### Goal

- Install the required tools: **Docker, Docker Compose, Git and Cron**.  
- Clone or update the application repository from GitHub.  
- Build Docker images and start the containers.  
- Rebuild the images without cache, so the system is always updated.  
- Create a cron job that runs every 5 minutes to keep the app updated.  

---

#### Repositories

- **Application** → [proway-docker-pizzaria](https://github.com/spttleonardo/proway-docker-pizzaria)  
  (source code and docker-compose file)

- **Deployment** → [pizzaria-deploy](https://github.com/spttleonardo/pizzaria-deploy)  
  (this repository, contains the `deploy.sh` script)

---

#### Requirements

- Debian/Ubuntu server  
- Root access (administrator privileges)  

---

#### How to Use

1. Clone this repository:

   ```bash
   git clone https://github.com/spttleonardo/pizzaria-deploy.git /root/pizzaria-deploy
   cd /root/pizzaria-deploy

2. Make the script executable:
   ```bash
    chmod +x deploy.sh
4. Run the script for the first tim:
   ```bash
   ./deploy.sh
