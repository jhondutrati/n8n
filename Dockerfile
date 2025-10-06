# Começa com a imagem base :latest, que sabemos que funciona no seu ambiente
FROM docker.n8n.io/n8nio/n8n:latest

# Pede permissão de administrador para instalar coisas
USER root

# Roda os comandos de instalação CORRETOS para Alpine Linux (apk),
# incluindo o Chromium e todas as suas dependências ("peças")
RUN apk update && \
    apk add --no-cache \
    chromium \
    udev \
    ttf-freefont \
    freetype \
    harfbuzz \
    nss \
    dbus-libs \
    expat-libs \
    libxcomposite \
    libxrandr \
    libxscrnsaver \
    libxtst \
    alsa-lib \
    at-spi2-atk \
    gdk-pixbuf \
    gtk+3.0

# Diz ao Puppeteer onde encontrar o Chromium que acabamos de instalar
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

# Devolve para o usuário normal por segurança
USER node