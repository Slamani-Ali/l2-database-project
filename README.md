# l2-database-project
L2 database project including SQL functions and documentation
#  Projet Base de Données — Fonctions des Responsables Politiques Français

##  Description du projet

Ce projet a été réalisé dans le cadre de la **Licence 2 Informatique — Université Le Havre Normandie (2025-2026)**.

L'objectif est de **modéliser et implémenter une base de données relationnelle** permettant de gérer les **fonctions exercées par des responsables politiques français**.

Le projet suit les étapes classiques de conception d'une base de données :

1. Modélisation **Entité / Association (E/A)**
2. Transformation en **modèle relationnel**
3. Implémentation SQL
4. Compatibilité avec **MySQL** et **PostgreSQL**

---

#  Modélisation

## Entités principales

### Responsable politique

Représente une personne ayant exercé une fonction politique.

| Attribut | Description |
|--------|--------|
| rp_id | Identifiant unique |
| rp_nom | Nom |
| rp_prenom | Prénom |
| rp_dateNaissance | Date de naissance |
| rp_dateDeces | Date de décès |

---

### Fonction

Représente une fonction politique.

| Attribut | Description |
|--------|--------|
| fonc_id | Identifiant de la fonction |
| fonc_titre | Titre de la fonction |
| rp_modNomination | Mode de nomination |

---

## Association : Exercer

Un responsable politique peut exercer **plusieurs fonctions**, et une fonction peut être exercée par **plusieurs responsables politiques**.

Il s'agit donc d'une relation **Many-to-Many**.

| Attribut | Description |
|--------|--------|
| rp_id | Clé étrangère vers Responsable_Politique |
| fonc_id | Clé étrangère vers Fonction |
| dateDebut | Date de début |
| dateFin | Date de fin |
| PartiPolitique | Parti politique |

Clé primaire composée :

```
(rp_id, fonc_id)
```

---

#  Structure de la base de données

Tables du projet :

```
G17_Responsable_Politique
G17_Fonction
G17_Exercer
```

Relations :

```
Responsable_Politique
        │
        │ (1,N)
        │
      Exercer
        │
        │ (N,1)
        │
      Fonction
```

---

#  Technologies utilisées

- SQL  
- MySQL  
- PostgreSQL  
- Modélisation E/A  
- Modèle relationnel  

---

#  Structure du projet

```
 Projet-BDD-G17
│
├── G17_FonctionMysql.sql
├── G17_FonctionPostgr.sql
├── G17_Fonction.pdf
└── README.md
```

| Fichier | Description |
|------|------|
| G17_FonctionMysql.sql | Script SQL pour MySQL |
| G17_FonctionPostgr.sql | Script SQL pour PostgreSQL |
| G17_Fonction.pdf | Documentation du projet |
| README.md | Présentation du projet |

---

#  Installation et utilisation

## 1️⃣ Cloner le projet

```bash
git clone https://github.com/votre-utilisateur/votre-repo.git
```

---

## 2️⃣ Importer la base de données

### MySQL

```sql
source G17_FonctionMysql.sql
```

### PostgreSQL

```sql
\i G17_FonctionPostgr.sql
```

---

#  Objectifs pédagogiques

Ce projet permet de pratiquer :

- la **modélisation de données**
- la transformation **E/A → relationnel**
- l'écriture de **scripts SQL**
- la gestion des **clés primaires et étrangères**
- la compatibilité **multi-SGBD**

---

#  Équipe du projet — Groupe 17

Projet réalisé par :

- **Ali Slamani**
- **Talha Ghezzar**

Licence 2 Informatique  
Université Le Havre Normandie  
Année universitaire **2025-2026**

---

⭐ Si ce projet vous aide ou vous inspire, n'hésitez pas à **mettre une étoile au repository** !
