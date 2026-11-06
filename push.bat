@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title Push GitHub - Super Runner Infini
cd /d "%~dp0"
echo ==============================================
echo    PUSH DIRECT GITHUB  -  Super Runner Infini
echo ==============================================
echo.

where git >nul 2>nul
if errorlevel 1 (echo [ERREUR] Git n'est pas installe : https://git-scm.com/downloads & pause & exit /b 1)

rem --- Identite Git (demandee une seule fois) ---
set "GN=" & set "GE="
for /f "delims=" %%i in ('git config --global user.name 2^>nul') do set "GN=%%i"
for /f "delims=" %%i in ('git config --global user.email 2^>nul') do set "GE=%%i"
if not defined GN set /p GN=Ton nom : 
if not defined GE set /p GE=Ton email GitHub : 
git config --global user.name "!GN!"
git config --global user.email "!GE!"

rem --- Depot local ---
if not exist ".git" (git init -q & git symbolic-ref HEAD refs/heads/main)
if not exist ".gitignore" (echo Thumbs.db>.gitignore & echo .DS_Store>>.gitignore & echo node_modules/>>.gitignore)

rem --- Range le workflow de deploiement au bon endroit ---
if exist "pages.yml" if not exist ".github\workflows\pages.yml" (
  mkdir ".github\workflows" 2>nul
  move /y "pages.yml" ".github\workflows\pages.yml" >nul
  echo [OK] pages.yml deplace dans .github\workflows\
)

rem --- Depot distant (une seule fois) ---
git remote get-url origin >nul 2>nul
if not errorlevel 1 goto commit
where gh >nul 2>nul
if errorlevel 1 goto askurl
gh auth status >nul 2>nul
if errorlevel 1 goto askurl

set "NAME="
set /p NAME=Nom du nouveau depot [super-runner-infini] : 
if not defined NAME set "NAME=super-runner-infini"
git add -A
git commit -qm "Premiere version" 2>nul
gh repo create "!NAME!" --public --source=. --remote=origin --push
if errorlevel 1 (echo [ERREUR] Creation du depot impossible. & pause & exit /b 1)
for /f %%o in ('gh api user -q .login') do set "OWNER=%%o"
gh api -X POST "repos/!OWNER!/!NAME!/pages" -f build_type=workflow >nul 2>nul
goto done

:askurl
echo.
echo Cree un depot VIDE sur https://github.com/new puis colle son URL ci-dessous.
set "URL="
set /p URL=URL du depot (https://github.com/pseudo/depot.git) : 
if not defined URL (echo [ERREUR] URL vide. & pause & exit /b 1)
git remote add origin "!URL!"

:commit
git add -A
git diff --cached --quiet
if errorlevel 1 (
  set "MSG="
  set /p MSG=Message du commit [Mise a jour] : 
  if not defined MSG set "MSG=Mise a jour %date% %time:~0,5%"
  git commit -qm "!MSG!"
) else (
  echo Rien de nouveau a commiter.
)

echo.
echo Envoi vers GitHub...
git push -u origin main
if errorlevel 1 (
  echo Push refuse : synchronisation avec le depot distant...
  git pull --rebase --allow-unrelated-histories origin main
  git push -u origin main
  if errorlevel 1 (echo [ERREUR] Push impossible. Verifie l'URL et ta connexion GitHub. & pause & exit /b 1)
)

:done
rem --- Calcule l'adresse du jeu depuis le depot distant ---
for /f "delims=" %%u in ('git remote get-url origin') do set "R=%%u"
set "R=!R:.git=!"
set "R=!R:https://github.com/=!"
set "R=!R:git@github.com:=!"
for /f "tokens=1,2 delims=/" %%a in ("!R!") do (set "LIVE=https://%%a.github.io/%%b/" & set "ACT=https://github.com/%%a/%%b/actions" & set "PGS=https://github.com/%%a/%%b/settings/pages")

echo.
echo ==============================================
echo  [OK] Publie !
echo  Jeu en ligne dans 1-2 min : !LIVE!
echo  Suivi du deploiement      : !ACT!
echo.
echo  Premiere fois seulement : Settings ^> Pages ^> Source : GitHub Actions
echo  !PGS!
echo ==============================================
start "" "!ACT!"
pause
