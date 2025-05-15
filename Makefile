# 🚀 Démarrer/Arrêter les conteneurs
up:
	docker compose up

down:
	docker compose down

rebuild:
	docker compose up --build

reset-db:
	docker compose down -v

# 🛠️ Installation des dépendances
install-frontend:
	docker compose exec frontend npm install

install-backend:
	docker compose exec backend composer install

# ⚙️ Symfony – Migration et Fixtures
migrate:
	docker compose exec backend php bin/console doctrine:migrations:migrate

fixtures:
	docker compose exec backend php bin/console doctrine:fixtures:load --no-interaction

# 🐚 Accès shell aux conteneurs
bash-backend:
	docker compose exec backend bash

bash-frontend:
	docker compose exec frontend bash

bash-db:
	docker compose exec db bash
