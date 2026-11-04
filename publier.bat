@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo === Publication sur GitHub Pages ===
where git >nul 2>nul
if errorlevel 1 (echo Git n'est pas installe : https://git-scm.com/downloads & pause & exit /b 1)
if not exist ".git" (git init & git branch -M main)
git remote get-url origin >nul 2>nul
if errorlevel 1 goto ask
goto push
:ask
set /p URL=Colle l'URL de ton depot GitHub (ex https://github.com/pseudo/depot.git) : 
git remote add origin %URL%
:push
git add -A
git commit -m "Mise a jour du jeu"
git push -u origin main
if errorlevel 1 (echo Echec du push. Verifie l'URL et ta connexion GitHub. & pause & exit /b 1)
echo.
echo Termine ! (une seule fois) Settings ^> Pages ^> Source : GitHub Actions
pause
