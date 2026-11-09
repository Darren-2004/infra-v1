# Infrastructure V1 - Déploiement Reproductible 2-Tiers

**Auteur :** Darren Fortun Fotsing Tankam  
**Module :** Cloud & Cybersécurité (BCA)  
**Enseignants :** DOMCHE Gabin & SOH Xavier  

---

## 1. Présentation du Projet
Ce projet met en œuvre une infrastructure 2-tiers automatisée et hautement reproductible à l'aide de **Vagrant** et **VirtualBox**.
L'objectif est de fournir un environnement composé d'un serveur Web et d'un serveur de Base de données PostgreSQL entièrement configurés et sécurisés par pare-feu (UFW) via des scripts de provisionnement Shell.

---

## 2. Architecture Réseau et Ports
L'infrastructure s'appuie sur le réseau privé *Host-Only* `192.168.56.0/24` :

* **Serveur Web (`web`) :**
  * **IP :** `192.168.56.10`
  * **Services :** Nginx (Port 80 HTTP)
  * **Accès SSH :** Port 22 (Autorisé)
* **Serveur Base de données (`db`) :**
  * **IP :** `192.168.56.20`
  * **Services :** PostgreSQL 16 (Port 5432)
  * **Accès SSH :** Port 22 (Autorisé)
  * **Sécurité :** Port 5432 restreint uniquement aux connexions provenant de la VM Web (`192.168.56.10`).

> Le schéma complet d'architecture est disponible sous `docs/architecture.png`.

---

## 3. Prérequis et Déploiement

### Prérequis logiciels
* VirtualBox (v7.0+)
* Vagrant (v2.3+)
* Git

### Procédure de Déploiement Automatisé
1. Cloner le dépôt et se placer dans le dossier :
   ```bash
   git clone [https://github.com/votre-compte/infra-v1-darren.git](https://github.com/votre-compte/infra-v1-darren.git)
   cd infra-v1-darren