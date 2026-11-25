#!/bin/bash
# English Literature Pro -> GitHub push script (double-click to run in Git Bash)
cd "$(dirname "$0")" || exit 1
REPO="https://github.com/tariqulislam4015/English-Literature-Pro.git"
echo "== English Literature Pro: GitHub-e push kora hocche =="
if [ -z "$(git config user.name)" ]; then git config --global user.name "Tariqul Islam"; fi
if [ -z "$(git config user.email)" ]; then git config --global user.email "tariqulislam4015@users.noreply.github.com"; fi
[ -d .git ] || git init
git checkout -B main >/dev/null 2>&1
if git remote | grep -q origin; then git remote set-url origin "$REPO"; else git remote add origin "$REPO"; fi
git pull origin main --allow-unrelated-histories --no-edit -X ours 2>/dev/null || echo "(pull dorkar nei)"
git add -A
git commit -m "Update English Literature Pro (12 books, PWA, Android APK build)" || echo "(notun kono change nei)"
echo "== Push hocche... login chaile browser-e Authorize korun =="
if git push -u origin main; then
  echo ""
  echo "SUCCESS! Push hoye geche."
  echo "APK 5-8 minute por ekhane pawa jabe:"
  echo "https://github.com/tariqulislam4015/English-Literature-Pro/releases/latest"
else
  echo ""
  echo "Push hoyni. Upore je error lekha ache, seta copy kore Claude-ke pathan."
fi
read -p "Bondho korte Enter chapun..."
