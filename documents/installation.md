# HOW TO INSTALL AND RUN YOWL APP

## Requirements

In order to run YOWL App, the following requirements must be met:

- An even version of [Node.js](https://nodejs.org/en/), greater than or equal to 12.22.1;

- PHP with its common extensions:
  ```
    sudo apt-get update
    sudo apt install php7.4-cli
    sudo apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip
  ```

- [Composer](https://getcomposer.org/download/), version 2;

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

## Installation

1. Clone the github repo.

2. Cd into the `api_laravel` folder and install Laravel dependencies: `composer install`.

3. Cd into the `client_vue` folder and install Vue.js dependencies: `yarn install`, or `npm install`.

4. Run `docker-compose up -d --build` to start the docker containers in development mode. If you get a permission error, be sure to update your folders permissions.

5. For production mode, use `mode=prod docker-compose up -d --build`.  
   For subsequent runs, the `--build` argument can be omitted.

PS: Depending on your docker setup, you may have to preprend all Docker commands with `sudo`.

## Docker config

1. The project has four docker services:

   - A MySQL database which credentials can be found in the docker-compose.yml file;
   - A phpmyadmin to interact with the database, accessible at localhost:8000;
   - A Laravel app used as api, accessible at localhost:8001;
   - A Vue.js app that serves the client interface, accessible at localhost:8080.  

2. To run Laravel's `Php artisan` commands, you have to connect directly to its container first, with `docker exec -it yowl_laravel /bin/bash`.