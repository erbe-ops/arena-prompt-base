# <NOM DU PROJET> — Mémoire externe persistante

Repository de mémoire externe multi-sessions (Arena Agent Mode, ChatGPT, Claude, Gemini…),
généré depuis le squelette d'`arena-prompt-base`.

## PROMPT DE RÉFÉRENCE

Le prompt de fonctionnement (`00.prompt.base.Github.md`) est une **copie** d'un original
centralisé, public :

- Dépôt : https://github.com/erbe-ops/arena-prompt-base
- Fichier brut : https://raw.githubusercontent.com/erbe-ops/arena-prompt-base/main/00.prompt.base.Github.md

Au **premier tour de chaque session** : comparer la version de la copie locale (en-tête
`# Version`) avec la référence. Référence plus récente → signaler, résumer, proposer la mise à
jour (jamais d'écrasement silencieux, sauf décision de pré-autorisation actée dans le projet).
URL injoignable → continuer avec la copie locale.

## Contenu

| Élément | Rôle |
|---|---|
| `00.prompt.base.Github.md` | Règles de fonctionnement — à lire en premier, toujours |
| `context-projet.md` | Mémoire active : état courant, décisions, prochaine action |
| `INVENTORY.md` | Inventaire persistant (ce qui existe, constaté, jamais déduit) |
| `decisions/` | Décisions actées, append-only |
| `journal/` | Journal append-only, une section par tour |
| `livrables/` | Documents produits pour l'utilisateur |
| `pieces-jointes/` | Filet de transport si une pièce jointe n'arrive pas au sandbox |
| `attachments/` | Documents fournis par l'utilisateur, archivés sous noms explicites |

Date au format **AAAAMMJJ** (v1.18). La mémoire est dans les fichiers ; la conversation n'est
qu'un moteur d'exécution.
