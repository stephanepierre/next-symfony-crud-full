## Lancer les conteneurs
up:
	docker-compose up -d

## Arrêter les conteneurs
down:
	docker-compose down

## Rebuild total sans restauration automatique
rebuild:
	docker-compose down --remove-orphans
	docker-compose build --no-cache
	docker-compose up -d

## Supprimer tout et tout recréer proprement
reset:
	docker-compose down --volumes --remove-orphans
	docker volume rm next-symfony-crud-full_db_data || true
	docker-compose build --no-cache
	docker-compose up -d

## Dump (sauvegarde) de la BDD
dump-db:
	docker exec -i next-symfony-crud-full-db-1 mysqldump -u root -proot symfony-next-test > dump.sql

## Restauration manuelle de la BDD depuis dump.sql
restore-db:
	docker exec -i next-symfony-crud-full-db-1 mysql -u root -proot symfony-next-test < dump.sql

## Exécuter les migrations
migrate:
	docker exec -it next-symfony-crud-full-backend-1 php bin/console doctrine:migrations:migrate --no-interaction

## Charger les fixtures
fixtures:
	docker exec -it next-symfony-crud-full-backend-1 php bin/console doctrine:fixtures:load --no-interaction

## Logs live
logs:
	docker-compose logs -f

## Commandes d'aide
help:
	echo Commandes disponibles :

help-up:
	echo "  make up           → Lancer les conteneurs"

help-down:
	echo "  make down         → Stopper les conteneurs"

help-rebuild:
	echo "  make rebuild      → Rebuild sans perte de données"

help-reset:
	echo "  make reset        → Reset complet avec migrations et fixtures"

help-restore-db:
	echo "  make restore-db   → Restaurer la base depuis dump.sql"

help-migrate:
	echo "  make migrate      → Lancer les migrations"

help-fixtures:
	echo "  make fixtures     → Charger les fixtures"
