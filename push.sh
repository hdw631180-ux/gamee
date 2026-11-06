#!/usr/bin/env bash
# Publie le jeu sur GitHub Pages en une commande : ./push.sh [nom-du-depot]
set -e
cd "$(dirname "$0")"
command -v git >/dev/null || { echo "Git n'est pas installé : https://git-scm.com/downloads"; exit 1; }
[ -d .git ] || { git init -q; git branch -M main; }
if ! git remote get-url origin >/dev/null 2>&1; then
  if command -v gh >/dev/null && gh auth status >/dev/null 2>&1; then
    NAME=${1:-super-runner-infini}
    git add -A; git commit -qm "Première version" || true
    gh repo create "$NAME" --public --source=. --remote=origin --push
    OWNER=$(gh api user -q .login)
    gh api -X POST "repos/$OWNER/$NAME/pages" -f build_type=workflow >/dev/null 2>&1 || true
    echo "✅ Dépôt créé. Le jeu sera en ligne dans 1-2 min : https://$OWNER.github.io/$NAME/"
    exit 0
  fi
  read -rp "URL de ton dépôt GitHub (ex : https://github.com/pseudo/depot.git) : " URL
  git remote add origin "$URL"
fi
git add -A
git commit -m "${MSG:-Mise à jour du jeu}" || echo "Rien de nouveau à publier."
git push -u origin main
echo "✅ Poussé ! (une seule fois) Settings → Pages → Source : GitHub Actions."
