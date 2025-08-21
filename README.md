# 🍕 Pizzaria Deploy

This repository contains the **deployment script** for the [Pizzaria Application](https://github.com/spttleonardo/proway-docker-pizzaria).  
The goal is to install and update the application dynamically on any Linux server, ensuring it is always synchronized with the GitHub repository.

---

## Objective

- Install all required dependencies (Docker, Docker Compose, Git, Cron).  
- Clone (or update) the application repository from GitHub.  
- Run Docker Compose to build and start the application.  
- Rebuild Docker images to guarantee no cache is used.  
- Configure a cron job that runs every 5 minutes to keep the system updated automatically.  

With this script, the application will always stay up to date after any push to the main repository.

---

##  Repositories

- **Application** → [proway-docker-pizzaria](https://github.com/spttleonardo/proway-docker-pizzaria)  
  Contains the source code and `docker-compose.yml` for the Pizzaria system.

- **Deployment** → [pizzaria-deploy](https://github.com/spttleonardo/pizzaria-deploy)  
  Contains the `deploy.sh` script to install, update and run the system.

---

## Requirements

- Debian/Ubuntu based server  
- Root privileges (to install packages and configure cron)  

---

##  How to Use

1. **Clone this repository** into your server:

   ```bash
   git clone https://github.com/spttleonardo/pizzaria-deploy.git /root/pizzaria-deploy
   cd /root/pizzaria-deploy
