# TP3 - Application Sécurisée avec DevSecOps

Ce projet démontre une application Node.js sécurisée utilisant Express, JWT, et un pipeline DevSecOps complet avec GitHub Actions.

## Fonctionnalités
- Authentification JWT
- Rate limiting et validation des entrées
- Conteneurisation Docker sécurisée
- Scans automatisés : SAST, SCA, secrets, conteneurs

## Pipeline DevSecOps
![Security](https://github.com/Butchows/tp3/workflows/DevSecOps%20Pipeline/badge.svg)

Le pipeline inclut :
- Build Docker
- Analyse statique (Semgrep)
- Analyse des dépendances (npm audit)
- Détection de secrets (Gitleaks)
- Scan de conteneurs (Trivy)
- Rapport final

## Installation
1. Cloner le repo
2. `cd src && npm install`
3. Configurer `.env` basé sur `.env.example`
4. `docker build -t tp3 .`
5. `docker run -p 3000:3000 tp3`

## Sécurité
- Utilisateur non-root dans Docker
- Healthcheck intégré
- Pas d'endpoint debug en production

![Security](https://github.com/butchows/tp3/workflows/DevSecOps%20Pipeline/badge.svg)