# Começa com a imagem base :latest, que sabemos que funciona no seu ambiente
FROM docker.n8n.io/n8nio/n8n:latest

# Pede permissão de administrador para instalar coisas
USER root

# Roda todos os comandos para baixar e instalar o Google Chrome
RUN apt-get update && apt-get install -y --no-install-recommends wget gnupg ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release xdg-utils --fix-missing && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && apt-get update && apt-get install -y google-chrome-stable

# Diz ao Puppeteer onde encontrar o Chrome que acabamos de instalar
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/google-chrome-stable"

# Devolve para o usuário normal por segurança
USER node