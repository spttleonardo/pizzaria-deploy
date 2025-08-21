#!/bin/bash 
# Deployment script for Pizzaria application
# Runs with Bash interpreter

# Variable that will be reused during the code 
REPO_URL="https://github.com/spttleonardo/proway-docker-pizzaria.git" # Git repository 
APP_DIR="/root/proway-pizzaria-app"  # where the application will be cloned
DEPLOY_DIR="/root/pizzaria-deploy" # Where deploy.sh is located
BRANCH="main" # Branch to be used
PKG=(docker.io docker-compose git cron) # Package array

# Loop to verify if the package does not exist, then update and install it 
for pkg in ${PKG[*]}; do
    if ! dpkg -l | grep -q "^ii\s\+${pkg}\s"; then
		echo echo "$pkg not found. Installing..."
        sudo apt update
        sudo apt install -y $pkg
	else
		echo "$pkg already installed."
    fi
done

# Conditional that checks if APP_DIR does not exist with ! and -d 
# (-d checks the directory and ! negates the answer)
if [ ! -d "$APP_DIR" ]; then
	sudo git clone -b $BRANCH $REPO_URL $APP_DIR
else
	cd $APP_DIR
	sudo git pull origin $BRANCH
fi

# Change directory into the folder where docker-compose.yml exists
cd $APP_DIR/pizzaria-app

# running docker-compose comands
sudo docker-compose build --no-cache # Rebuild docker images to make sure old cache is not used
sudo docker-compose down 
sudo docker-compose up -d 

# Create a string that represents a cron job and execute it every 5 minutes as root in APP_DIR
CRON_JOB="*/5 * * * * $DEPLOY_DIR/deploy.sh >> /var/log/pizzaria-app-deploy.log 2>&1"

# Conditional that verifies if the cron job already exists, if so it does nothing
if ! sudo crontab -l 2>/dev/null | grep -q "$DEPLOY_DIR/deploy.sh"; then
	(sudo crontab -l 2>/dev/null; echo "$CRON_JOB") | sudo crontab -
	echo "Cron job installed: runs every 5 minutes"
else
	echo "Cron job already exists"
fi

echo "Deployment complete!"
