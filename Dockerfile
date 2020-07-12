#FROM php:7.0-apache
#COPY ./src /var/www/html/src
#COPY autoLoad.php /var/www/html
#COPY phpinfo.php /var/www/html
#COPY ./.htaccess /var/www/html
#COPY composer.json /var/www/html
#RUN apt update -y && apt upgrade -y && apt install git -y && docker-php-ext-install pdo pdo_mysql
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN composer require aws/aws-sdk-php
#WORKDIR /var/www/html
#EXPOSE 80

#Load the python base image, so we won't need to run commands for python and pip installation.
FROM python:3.8.3
COPY ./requirements.txt /requirements.txt
WORKDIR /
RUN pip3 install -r requirements.txt
COPY . /
ENTRYPOINT [ "python3" ]
CMD [ "app/app.py" ]