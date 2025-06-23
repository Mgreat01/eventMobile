#!/bin/bash

echo "🔄 Compilation Flutter Web..."
flutter build web

echo "📦 Compression du build..."
zip -rq web_build.zip build/web

echo "🛠️ Génération de fichiers Firebase..."
cat > firebase.json <<JSON
{
  "hosting": {
    "public": "build/web",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "cleanUrls": true,
    "rewrites": [{"source": "**", "destination": "/index.html"}]
  }
}
JSON

cat > .firebaserc <<CONF
{
  "projects": {
    "default": "eventspot-mobile-34284421"
  }
}
CONF

echo "🚀 Déploiement Firebase..."
firebase deploy

echo "✅ Déploiement terminé avec succès !"
