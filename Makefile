APP_CONTAINER=app

init:
	make build
	make up
	sleep 10
	docker compose exec app bash -c " \
		composer create-project laravel/laravel . && \
		composer require filament/filament && \
		php artisan filament:install --panels && \
		cp .env.example .env && \
		php artisan key:generate && \
		sed -i 's/DB_HOST=127.0.0.1/DB_HOST=db/' .env && \
		echo 'ADMIN_EMAIL=admin@example.com' >> .env && \
		echo 'ADMIN_PASSWORD=password' >> .env && \
		php artisan migrate --seed"

up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

bash:
	docker compose exec $(APP_CONTAINER) bash

artisan:
	docker compose exec $(APP_CONTAINER) php artisan $(cmd)

composer:
	docker compose exec $(APP_CONTAINER) composer $(cmd)

npm:
	docker compose exec $(APP_CONTAINER) npm $(cmd)

init: build up wait install-filament

wait:
	@echo \"Waiting for MySQL to be ready...\"
	sleep 10

install-filament:
	docker compose exec $(APP_CONTAINER) bash -c \"\
		composer create-project laravel/laravel . && \
		composer require filament/filament && \
		php artisan migrate && \
		echo 'Filament installed.'\"

reset:
	docker compose down -v && docker compose up -d --build
