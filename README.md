# 🍄 Super Runner Infini

Un runner 2D **infini** façon Super Mario Bros × Subway Surfers, jouable dans le navigateur (ordinateur et mobile), installable comme une app et jouable hors ligne.

**Jouer :** `https://TON-PSEUDO.github.io/NOM-DU-DEPOT/`

## Fonctionnalités
- Génération infinie, vitesse qui augmente avec la distance, 4 zones (jour, coucher de soleil, nuit, vert)
- Écraser les ennemis, se baisser sous les oiseaux, monter sur les tuyaux et les briques
- Bonus : aimant, bouclier, pièces ×2, étoile invincible
- Boutique : double saut, aimant+, bouclier de départ, pièces dorées, 5 costumes
- Sauvegarde automatique (pièces, achats, record), sons, pause, plein écran
- PWA : installable, fonctionne hors ligne

## Commandes
| Action | Clavier | Mobile |
|---|---|---|
| Sauter (maintenir = plus haut) | Espace / ↑ / W | toucher à droite |
| Se baisser | ↓ / S | toucher à gauche |
| Pause / plein écran | P ou Échap / F | bouton ⏸ |

## Publier sur GitHub Pages
1. Installe [Git](https://git-scm.com/downloads) et crée un dépôt vide sur GitHub.
2. Windows : double-clique `publier.bat`. Mac / Linux : `./publier.sh`. Colle l'URL du dépôt quand on te la demande.
3. Une seule fois : **Settings → Pages → Source : GitHub Actions**.

Ensuite, chaque relance du script met le site à jour automatiquement (déploiement via `.github/workflows/pages.yml`).
Avec la CLI [`gh`](https://cli.github.com) connectée, `./publier.sh mon-depot` crée le dépôt et active Pages tout seul.

## Tester en local
```bash
python3 -m http.server 8000   # puis ouvre http://localhost:8000
```

## Structure
`index.html` (le jeu) · `sw.js` + `manifest.webmanifest` (PWA) · `404.html` · `icon-*.png` / `icon.svg` · `publier.sh|bat` (push direct) · `.github/workflows/pages.yml` (déploiement)

## Licence
MIT, voir `LICENSE`.
