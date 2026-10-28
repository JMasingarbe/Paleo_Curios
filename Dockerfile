FROM php:8.4-apache

# Extension PDO MySQL (absente de l'image officielle)
RUN docker-php-ext-install pdo_mysql

# Le site est servi depuis public/ (le .env, src/, vendor/ restent inaccessibles depuis le navigateur)
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
 && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
 && a2enmod rewrite
