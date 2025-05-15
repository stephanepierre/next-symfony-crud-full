# Next.js + Symfony (MySQL + Docker)

Ce projet est une application full-stack composée de :

- **Frontend** : [Next.js 15.3.2](https://nextjs.org/) (avec SCSS)
- **Backend** : [Symfony 7.2](https://symfony.com/) avec Doctrine ORM
- **Base de données** : MySQL 8 (conteneur Docker)
- **Administration BDD** : phpMyAdmin
- **Environnement** : Docker + makefile

---

## Structure du projet

next-symfony-crud-full/
├── frontend-next/ # Application Next.js (React)
│ └── Dockerfile
├── backend-symfony/ # API Symfony (REST ou autre)
│ └── Dockerfile
├── docker-compose.yml # Configuration des conteneurs
├── Makefile # Raccourcis pour les commandes courantes
├── .env # Variables d'environnement Symfony
├── README.md # Ce fichier


---

## Démarrage du projet

### 1. Installer Docker Desktop (si ce n’est pas déjà fait)
> https://www.docker.com/products/docker-desktop/

### 2. Lancer le projet

```bash
make up

--- 

### 3. Accéder aux services

| Service     | URL                                            |
| ----------- | ---------------------------------------------- |
| Next.js     | [http://localhost:3000](http://localhost:3000) |
| Symfony API | [http://localhost:8000](http://localhost:8000) |
| phpMyAdmin  | [http://localhost:8080](http://localhost:8080) |

## 🔑 phpMyAdmin login :

> 🛡️ Identifiants phpMyAdmin :
> Ces identifiants sont définis dans le fichier `docker-compose.yml` (variables d’environnement du service `db`). Ne pas exposer en production.


## Raccourcis Makefile
| Action	                                | Commande                  |
| ---------------------------------------   | ------------------------- |                            
| Démarrer l’environnement	                | make up                   |
| Rebuilder les conteneurs	                | make rebuild              |
| Stopper les conteneurs	                | make down                 |
| Réinitialiser la base	                    | make reset-db             |
| Installer dépendances Next.js	            | make install-frontend     |
| Installer dépendances Symfony	            | make install-backend      |
| Lancer les migrations	                    | make migrate              |
| Charger les fixtures	                    | make fixtures             |
| Entrer dans le backend (bash)	            | make bash-backend         |   
| Entrer dans le frontend (bash)	        | make bash-frontend        |

## 🛠️ Configuration base de données
MySQL tourne dans Docker (service: db)

Symfony se connecte via DATABASE_URL dans .env :

dotenv
Copier
Modifier
DATABASE_URL="mysql://symfony:symfony@db:3306/symfony-next-test?serverVersion=8.0"
Les données sont stockées dans un volume Docker (db_data).

## ✅ À venir
Authentification JWT

Appels API sécurisés entre Next.js et Symfony

Déploiement (Vercel + Railway, ou VPS Dockerisé)