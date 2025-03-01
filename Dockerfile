FROM node:23-bookworm-slim

# Cria o diretório de trabalho e define as permissões
WORKDIR /home/node/app

#instala o git e curl
RUN apt-get update && apt-get install -y git curl

# Instala o CLI do NestJS com permissões de superusuário
RUN npm install -g @nestjs/cli

# Define o usuário para node
USER node
