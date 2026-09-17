# arena-prompt-base

Prompt de référence du système de mémoire externe multi-sessions
(Arena Agent Mode, ChatGPT, Claude, Gemini…).

> **Public à dessein.** Le cloisonnement des sessions Arena empêche un agent de lire un dépôt
> privé autre que le sien — dans les deux sens. Une URL publique est le seul canal de partage
> possible entre projets.
>
> Ce fichier ne contient **aucune donnée personnelle, aucun identifiant, aucune adresse réseau** :
> ce sont des règles de méthode, réutilisables par quiconque.

## Version courante

**v2.1 (noyau) — Annexes 2.1** — 20260917

## Utilisation

Chaque projet embarque sa copie de `00.prompt.base.Github.md` (noyau) + `00.annexes.Github.md` (annexes).
Le noyau est lu au tour 1, avant tout accès réseau, et reste lisible hors ligne. Ce dépôt fait foi.
Lien brut noyau :
https://raw.githubusercontent.com/erbe-ops/arena-prompt-base/main/00.prompt.base.Github.md
Lien brut annexes :
https://raw.githubusercontent.com/erbe-ops/arena-prompt-base/main/00.annexes.Github.md

## Historique des versions

| Version | Date | Changement |
|---|---|---|
| **v1.17** | 030926 | **Prompt de référence centralisé** : dépôt public, comparaison de version au tour 1, cloisonnement rappelé comme étanche dans les deux sens |
| v1.16 | 030926 | **Amorçage minimal** : une ligne suffit, tout le reste est déduit des fichiers ; interdiction de réclamer une information déjà présente |
| v1.15 | 020926 | Calibrer la recommandation sur le **risque réel**, jamais sur un principe général |
| v1.13 | 020926 | **Vérifier avant de prescrire** : une seule préconisation, jamais de réserve reléguée |
| v1.11 | 020926 | **Capacité vision** : à tester chaque session, jamais présumée |
| v1.10 | 010926 | Mode de reprise optimisé : `main` = branche officielle de reprise |
| v1.7 | 260826 | Vigilance parc logiciel, procédure SSH, horodatage |
| v1.6 | — | Anti-plantage : jamais plus de 20 lignes brutes dans le chat |
| v1.5 | — | Récupération de branche (étape 0) |
| v1.4 | — | Auto-détection de saturation + procédure de bascule |

## Publier une nouvelle version

```powershell
cd ~\arena-prompt-base
git pull
# modifier 00.prompt.base.Github.md + la ligne "Version courante" ci-dessus
git add -A ; git commit -m "v1.18 - <ce qui change>" ; git push
```
