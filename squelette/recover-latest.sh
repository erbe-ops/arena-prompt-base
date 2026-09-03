#!/bin/sh
# recover-latest.sh — récupère l'état le plus récent du projet, quelle que soit la branche courante
# (conservé du NAS v1.7 — T176-branch-recovery)
set -u
echo "== 1/4 fetch =="
git fetch --all --prune || true
echo ""
echo "== 2/4 branches (date dernier commit décroissante) =="
git for-each-ref --sort=-committerdate --format='%(committerdate:iso8601) | %(refname:short) | %(objectname:short) | %(subject)' refs/remotes refs/heads
LATEST=$(git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/remotes refs/heads | grep -E '(^origin/(main|arena/)|^(main|arena/))' | head -n1)
CUR=$(git rev-parse --abbrev-ref HEAD)
echo ""
echo "== 3/4 branche courante : $CUR | la plus récente : $LATEST =="
if [ -z "$LATEST" ]; then echo "Aucune branche trouvée"; exit 0; fi
if [ "$LATEST" != "$CUR" ]; then
  echo "Fast-forward $CUR -> $LATEST ..."
  if git merge --ff-only "$LATEST"; then echo "OK fast-forward."; else echo "WARN divergence, comparer git log --oneline --graph --all"; exit 1; fi
else
  echo "Branche courante déjà la plus récente."
fi
echo ""
echo "== 4/4 état final =="
git log --oneline -3
