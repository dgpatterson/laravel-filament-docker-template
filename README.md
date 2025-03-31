# Laravel + Filament Docker Template

A modern Laravel 11 + Filament 3 development environment powered by Docker. Includes PHP 8.3, MySQL, Mailhog, nginx, and optional queue/scheduler workers. No frontend tooling (like Vite) required.

---

## 🚀 Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/YOUR-USERNAME/laravel-filament-docker-template.git
cd laravel-filament-docker-template
```

### 2. Build and start the containers
```bash
make build
make up
```

### 3. Bash into the PHP container and install Laravel
```bash
make bash
composer create-project laravel/laravel .
```

### 4. Install Filament
```bash
composer require filament/filament
php artisan filament:install --panels
```

### 5. Set up environment
```bash
cp .env.example .env
php artisan key:generate
```
Edit `.env`:
```env
DB_HOST=db
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=password
```

### 6. Run migrations and seed the default admin user
```bash
php artisan migrate --seed
```

### 7. Log into Filament admin panel
Visit [http://localhost/admin](http://localhost/admin) and log in with the credentials from your `.env` file.

---

## 🧰 Included Services
- **PHP 8.3** – via custom Dockerfile
- **MySQL 8** – for database
- **nginx** – web server
- **Mailhog** – catch local mail at [http://localhost:8025](http://localhost:8025)
- **Optional queue & scheduler** – preconfigured, just uncomment in `docker-compose.yml`

---

## 🛠 Makefile Commands
```bash
make init       # Full setup: build containers, install Laravel, Filament, and seed admin user
```bash
make up         # Start the containers
make down       # Stop the containers
make build      # Build/rebuild containers
make bash       # Shell into the PHP app container
make artisan cmd="migrate"  # Run artisan command
make composer cmd="require filament/filament"  # Run composer command

---

## ✅ To-Do
- [x] Add `make init` script to automate setup
- Create GitHub template version
- Add volume for persistent MySQL

---

## License
MIT
