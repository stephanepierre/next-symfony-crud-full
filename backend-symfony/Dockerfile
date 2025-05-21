FROM php:8.3-cli

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    git unzip curl zip libicu-dev libzip-dev libonig-dev libpq-dev libxml2-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip opcache

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application
COPY . .

# Installer les dépendances PHP avec Composer
RUN composer install --no-interaction

# Exposer le port utilisé par le serveur PHP
EXPOSE 8000

# Lancer le serveur Symfony (ou PHP built-in)
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
