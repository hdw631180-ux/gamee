<div align="center">

<img src="icon-192.png" width="120" alt="Super Runner Infini">

# 🍄 SUPER RUNNER INFINI

**Le runner 2D sans fin façon Super Mario Bros × Subway Surfers**
Ordinateur · Mobile · Installable · Jouable hors ligne

![version](https://img.shields.io/badge/version-2.0-ffd23f?style=for-the-badge)
![pwa](https://img.shields.io/badge/PWA-offline-5cb82a?style=for-the-badge)
![zero deps](https://img.shields.io/badge/d%C3%A9pendances-0-e52521?style=for-the-badge)
![license](https://img.shields.io/badge/licence-MIT-2b4acb?style=for-the-badge)

### ▶ [Jouer maintenant](https://TON-PSEUDO.github.io/NOM-DU-DEPOT/)

</div>

---

## ✨ Nouveautés de la v2.0

| | |
|---|---|
| 🎬 **Menus animés** | Transitions fluides, titre flottant, boutons réactifs, écran d'aide |
| 🏃 **Animations pro** | Squash & stretch, ombre, poussière, particules qui s'estompent |
| ⏱️ **Compte à rebours** | 3 · 2 · 1 · GO ! avant chaque partie |
| 🔥 **Combos** | Écrase les ennemis à la chaîne : ×2, ×3, ×4… |
| 📊 **HUD moderne** | Pastilles arrondies, barre de progression de zone, barres de bonus |
| 🎵 **Musique chiptune** | Qui s'accélère avec la vitesse du jeu |
| 💥 **Game feel** | Flash, tremblement d'écran, vibration mobile, traits de vitesse |
| 🏆 **Records** | Badge « Nouveau record » en fin de partie |

## 🎮 Fonctionnalités

- **Génération infinie** : la vitesse augmente avec la distance
- **4 zones** : jour → coucher de soleil → nuit → forêt
- **Obstacles variés** : trous, tuyaux, briques, ennemis, oiseaux
- **Bonus** : 🧲 aimant · 🛡️ bouclier · 🪙 pièces ×2 · ⭐ étoile invincible
- **Boutique** : double saut, aimant+, bouclier de départ, pièces dorées, 5 costumes
- **Sauvegarde automatique** : pièces, achats, record
- **PWA** : installable sur l'écran d'accueil, fonctionne sans connexion

## 🕹️ Commandes

| Action | Clavier | Mobile |
|---|---|---|
| Sauter *(maintenir = plus haut)* | `Espace` · `↑` · `W` | toucher à droite |
| Se baisser | `↓` · `S` | toucher à gauche |
| Pause | `P` · `Échap` | bouton ⏸ |
| Plein écran | `F` | — |

## 🚀 Publier en un clic

1. Installe [Git](https://git-scm.com/downloads) (et, idéalement, la CLI [`gh`](https://cli.github.com)).
2. **Windows** : double-clique sur `push.bat` · **Mac / Linux** : `./push.sh`
3. Première fois seulement : **Settings → Pages → Source : GitHub Actions**

Avec `gh` connecté, le script crée le dépôt et active Pages automatiquement.
Ensuite, chaque lancement met le site à jour (déploiement via `.github/workflows/pages.yml`).

## 🧪 Tester en local

```bash
python3 -m http.server 8000
# puis ouvre http://localhost:8000
```

## 🗂️ Structure

```
.
├── index.html               # le jeu complet (HTML + CSS + JS)
├── sw.js                    # service worker (hors ligne)
├── manifest.webmanifest     # configuration PWA
├── icon.svg · icon-*.png    # icônes
├── 404.html · robots.txt
├── push.bat · push.sh       # publication directe sur GitHub
└── .github/workflows/
    └── pages.yml            # déploiement GitHub Pages
```

## 🛣️ Idées pour la suite

- [ ] Missions quotidiennes
- [ ] Classement en ligne
- [ ] Sprites pixel-art animés
- [ ] Nouveaux ennemis et boss de zone

## 📄 Licence

MIT, voir [`LICENSE`](LICENSE).

<div align="center"><sub>Fait avec ❤️ et beaucoup de pièces 🪙</sub></div>
