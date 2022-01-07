# YOWL APP
***
YOWL APP is a solution from client needs. It is a web application which centralises comments about any products or services offered by all web sites.

## Table of Contents
***
- [YOWL APP](#yowl-app)
  - [Table of Contents](#table-of-contents)
  - [General info](#general-info)
  - [Technologies](#technologies)
  - [Technical requirements](#technical-requirements)
  - [Install](#install)
  - [Dev team members ✨](#dev-team-members-)

## General info
***
YOWL APP is a web application that will allow users to comment on all of the content found on the Internet. Each comment will be shared by the entire YOWL user community. The home page gives you the opportunity, user or not to read the latest reviews.
In order to make a comment, you need to be registered.
After the registration, you need to login to make your comment on every experience you made on a web site.
You can modify or delete your reviews whenever you want.
You can read more about YOWL specifications [here](documents/specifications.md).

## Technologies
***
Here are the technologies used in YOWL APP:
* [Laravel] Version 8
* [Vuejs] Version 3
* [phpMyAdmin] Version 5
* [MySQL]

## Technical requirements
***
Before installing this project, you must have ```Node.js```, ```PHP``` with its common extensions, ```Composer```, ```Docker``` and ```Docker-compose``` installed on your system.

## Install
***
1. Clone the github repo.

2. Cd into the `api_laravel` folder and install the dependencies: ```composer install```.

3. Cd into the ```client_vue``` folder and install the dependencies: ```yarn install```, or ```npm install```.

4. Run ```docker-compose up -d --build``` to start the docker containers in development mode,

5. For production mode, use ```mode=prod docker-compose up -d --build```.  
   For subsequent runs, the ```--build``` argument can be omitted.

More detailed installation instructions can be found [here](documents/installation.md).

## Dev team members ✨
***
This project has been brought to life by the Bazinga Team.
