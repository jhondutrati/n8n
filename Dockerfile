# Começa com a imagem base :latest
FROM docker.n8n.io/n8nio/n8n:latest

# Pede permissão de administrador
USER root

# A LISTA DE PEÇAS MÍNIMA E ESSENCIAL para o Chromium rodar
RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    gcompat

# Diz ao Puppeteer onde encontrar o Chromium
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

# Devolve para o usuário normal por segurança
USER node