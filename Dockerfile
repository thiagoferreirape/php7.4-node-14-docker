FROM php:7.4-apache

ENV ACCEPT_EULA=Y


USER root

WORKDIR /var/www/html

RUN apt update && apt install -y \
    gnupg2 \
    libpng-dev\
    libfreetype6-dev \
    libjpeg62-turbo-dev \ 
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    zip \
    curl \
    unzip \
    wget \
    git \
    nano \
    fontconfig libxrender1 xfonts-75dpi xfonts-base cabextract


RUN apt-get update



# RUN touch ~/.bashrc && chmod +x ~/.bashrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 14.19.2
RUN . "$NVM_DIR/nvm.sh" && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    nvm install-latest-npm


# RUN . ~/.nvm/nvm.sh && nvm install node
# RUN . ~/.nvm/nvm.sh && nvm install v14.19.2
# RUN nvm install-latest-npm

# RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# RUN docker-php-ext-install -j$(nproc) gd \
#     && docker-php-ext-install pdo_mysql \
#     && docker-php-ext-install mysqli \
#     && docker-php-ext-install zip \
#     && docker-php-source delete

# RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb \
#     && dpkg -i wkhtmltox_0.12.6-1.buster_amd64.deb

# RUN wget http://ftp.br.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb \
#     && dpkg -i ttf-mscorefonts-installer_3.6_all.deb

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN chown -R www-data:www-data /var/www/html && a2enmod rewrite
