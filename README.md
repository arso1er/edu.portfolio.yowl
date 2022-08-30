<p align="center">
  <a href="https://yowl.jeffvodo.me">
    <img src="https://yowl.jeffvodo.me/favicon.png?v=1" height="128">
    <h1 align="center">YOWL</h1>
  </a>
</p>

## About YOWL

YOWL is a web application that allows you to comment on any content visible on the Internet and to share it with the YOWL community!

Visit <a aria-label="visit YOWL" href="https://yowl.jeffvodo.me">https://yowl.jeffvodo.me</a> to take a look at YOWL.

## Tech stack and installation

YOWL is built with Laravel, MySQL and Vue.js. You can get it running with the following steps:

- Clone the repository;
- Install `Vue CLI` globally;
- Go to the `vue` folder with `cd vue`;
- Update environment variables in `.env`;
- Install dependencies with `yarn install`;
- To start the frontend in development mode, run `yarn serve:dev`;
- Go to the `laravel` folder with `cd laravel`;
- Install dependencies with `composer install`;
- Create a `.env` file following the `.env.example` model;
- Create your database in MySQL and migrate by running `php artisan migrate`;
- To start the backend, run `php artisan serve --port=${PORT}` where `${PORT}` should match **VUE_APP_API_BASEURL**'s port in `vue/.env`.

## License

YOWL is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
