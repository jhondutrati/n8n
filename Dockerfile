# Começa com a imagem base :latest, que sabemos que funciona no seu ambiente
FROM docker.n8n.io/n8nio/n8n:latest

# Pede permissão de administrador para instalar coisas
USER root

# A LISTA DE PEÇAS FINAL E CORRIGIDA para o sistema Alpine
RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    gcompat \
    libx11 \
    libxcomposite \
    libxrandr \
    libxscrnsaver \
    libxtst \
    alsa-lib \
    at-spi2-core \
    atk \
    cairo \
    cups \
    dbus \
    expat \
    gdk-pixbuf \
    gtk+3.0 \
    pango

# Diz ao Puppeteer onde encontrar o Chromium que acabamos de instalar
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

# Devolve para o usuário normal por segurança
USER node