# Makefile : outils full-stack Symfony + Next.js + MySQL

# Variables
DB_CONTAINER=next-symfony-crud-full-db-1
BACKEND_CONTAINER=next-symfony-crud-full-backend-1
DUMP_FILE=dump.sql

## Lancer les conteneurs
up:
	docker-compose up -d

## Arrêter les conteneurs
down:
	docker-compose down

## Rebuild total sans perte de données (si dump.sql est présent)
rebuild:
	docker-compose down --remove-orphans
	docker-compose build --no-cache
	docker-compose up -d
	$(MAKE) restore-or-migrate

## Supprimer tout et tout recréer proprement
reset:
	docker-compose down --volumes --remove-orphans
	docker volume rm next-symfony-crud-full_db_data || true
	docker-compose build --no-cache
	docker-compose up -d
	$(MAKE) migrate
	$(MAKE) fixtures

## Dump (sauvegarde) de la BDD
dump-db:
	docker exec -i next-symfony-crud-full-db-1 mysqldump -u root -proot symfony-next-test > dump.sql

restore-db:
	docker exec -i next-symfony-crud-full-db-1 mysql -u root -proot symfony-next-test < dump.sql

migrate:
	docker exec -it next-symfony-crud-full-backend-1 php bin/console doctrine:migrations:migrate --no-interaction

fixtures:
	docker exec -it next-symfony-crud-full-backend-1 php bin/console doctrine:fixtures:load --no-interaction

## Logs live
logs:
	docker-compose logs -f
