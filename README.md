# Docker Laravel

A pretty simplified Docker Compose workflow that sets up a LEMP (Linux, NGINX, MariaDB, PHP) network of containers for local Laravel development.

## Use

To get started, make sure you have [Docker installed](https://docs.docker.com/) on your system and [Docker Compose](https://docs.docker.com/compose/install/), and then clone this repository.

1. Clone this project:

   ```sh
   git clone https://github.com/shohrukhkhon/docker-laravel.git
   ```

2. Inside the folder `docker-laravel` and Generate your own `.env` to docker compose with the next command:

   ```sh
   cp .env.example .env
   ```

3. You need **Create** or **Put** your laravel project in the folder source `src`.
    ```sh
    laravel new my-app
    ```
4. Build the project whit the next commands:

   ```sh
   docker-compose up --build
   ```

---

## Remember

The configuration of the database **must be the same on both sides** .

```dotenv
# .env
APP_NAME=application
MYSQL_ROOT_PASSWORD=rootpass
APP_DIR=app
NGINX_PORT=80
DB_PORT=3306
REDIS_PORT=6379
```

---

## Special Cases

To Down and remove the volumes we use the next command:

```sh
docker-compose down -v
```

Update Composer:

```sh
docker-compose run --rm composer update
```

Run all migrations:

```sh
docker-compose run --rm artisan migrate
```