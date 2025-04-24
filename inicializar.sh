#!/bin/bash

# Actualizar paquetes
echo "Actualizando paquetes..."
sudo apt update -y && sudo apt upgrade -y

# Instalar paquetes esenciales
echo "Instalando paquetes esenciales..."
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git

# Agregar la clave GPG oficial de Docker
echo "Agregando clave GPG de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker
echo "Agregando repositorio de Docker..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar e instalar Docker
echo "Instalando Docker..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Configurar Docker para que se inicie automáticamente
echo "Habilitando Docker en el arranque..."
sudo systemctl enable docker
sudo systemctl start docker

# Instalar Docker Compose
echo "Instalando Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Agregar el usuario actual al grupo docker
echo "Agregando usuario actual al grupo docker..."
sudo usermod -aG docker $USER

# Instalar Node.js y npm
echo "Instalando Node.js y npm..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Instalar dependencias globales para Next.js
echo "Instalando dependencias globales de Next.js..."
sudo npm install -g npm@latest
sudo npm install -g next

# Finalizar
echo "Configuración completada. Es necesario reiniciar para que los cambios surtan efecto."
echo "Ejecuta: sudo reboot"

exit 0

