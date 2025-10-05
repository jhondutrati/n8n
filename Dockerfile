# Passo 1: Começa com a imagem base :latest, que é baseada em Alpine Linux
FROM docker.n8n.io/n8nio/n8n:latest

# Passo 2: Pede permissão de administrador para instalar coisas
USER root

# Passo 3: Roda os comandos de instalação CORRETOS para Alpine Linux (apk)
# Em vez de Google Chrome, vamos instalar o Chromium, que é a versão de código aberto e compatível.
RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    json-glib

# Passo 4: Diz ao Puppeteer onde encontrar o Chromium que acabamos de instalar
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

# Passo 5: Devolve para o usuário normal por segurança
USER node

#final