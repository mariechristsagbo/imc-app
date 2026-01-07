# 🔧 Commandes Flutter essentielles

Guide de référence rapide pour les commandes Flutter couramment utilisées.

---

## 📦 Gestion des dépendances

```bash
# Installer/mettre à jour les dépendances
flutter pub get

# Mettre à jour les dépendances vers les dernières versions
flutter pub upgrade

# Nettoyer le cache des packages
flutter pub cache clean

# Voir les dépendances obsolètes
flutter pub outdated
```

---

## 🏃 Lancer l'application

```bash
# Lancer sur l'appareil par défaut
flutter run

# Lister les appareils disponibles
flutter devices

# Lancer sur un appareil spécifique
flutter run -d <device-id>

# Lancer en mode release (optimisé)
flutter run --release

# Lancer avec hot reload activé (par défaut)
flutter run

# Pendant l'exécution :
# r = hot reload (recharge les changements)
# R = hot restart (redémarre complètement l'app)
# q = quitter
# p = afficher les grilles de debug
# o = basculer iOS/Android
```

---

## 🔍 Analyse et qualité du code

```bash
# Analyser le code (linter)
flutter analyze

# Formater le code automatiquement
flutter format lib/

# Formater un fichier spécifique
flutter format lib/main.dart
```

---

## 🧪 Tests

```bash
# Lancer tous les tests
flutter test

# Lancer un fichier de test spécifique
flutter test test/widget_test.dart

# Lancer avec couverture de code
flutter test --coverage

# Voir le rapport de couverture (nécessite lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🏗️ Build (compilation)

### Android
```bash
# Build APK (debug)
flutter build apk

# Build APK (release)
flutter build apk --release

# Build AAB (Android App Bundle) pour le Play Store
flutter build appbundle --release

# Build APK par ABI (réduit la taille)
flutter build apk --split-per-abi
```

### iOS
```bash
# Build iOS (nécessite macOS)
flutter build ios

# Build iOS en mode release
flutter build ios --release
```

### Web
```bash
# Build pour le web
flutter build web

# Serveur local pour tester
flutter run -d chrome
```

---

## 🧹 Nettoyage

```bash
# Nettoyer le dossier build
flutter clean

# Nettoyer et réinstaller les dépendances
flutter clean && flutter pub get
```

---

## 📱 Émulateurs et simulateurs

```bash
# Lancer un émulateur Android
flutter emulators
flutter emulators --launch <emulator_id>

# Lancer le simulateur iOS (macOS uniquement)
open -a Simulator
```

---

## 🔧 Configuration Flutter

```bash
# Voir la configuration Flutter
flutter doctor

# Diagnostics détaillés
flutter doctor -v

# Voir la version de Flutter
flutter --version

# Mettre à jour Flutter
flutter upgrade

# Changer de canal (stable, beta, dev)
flutter channel stable
flutter upgrade
```

---

## 📊 Performance et debugging

```bash
# Lancer avec l'observatoire (profiler)
flutter run --observatory-port=8888

# Profiler de performance
flutter run --profile

# Trace de performance
flutter run --trace-startup
```

---

## 🌐 Créer un nouveau projet

```bash
# Créer un nouveau projet Flutter
flutter create nom_du_projet

# Créer avec un template spécifique
flutter create --template=app nom_du_projet

# Créer un package
flutter create --template=package nom_du_package

# Créer un plugin
flutter create --template=plugin nom_du_plugin
```

---

## 📦 Ajouter des dépendances rapidement

```bash
# Ajouter une dépendance
flutter pub add nom_du_package

# Ajouter une dev dependency
flutter pub add --dev nom_du_package

# Exemples
flutter pub add http
flutter pub add provider
flutter pub add shared_preferences
flutter pub add --dev flutter_test
```

---

## 🔥 Commandes utiles pour cette app IMC

```bash
# 1. Installer les dépendances
flutter pub get

# 2. Vérifier qu'il n'y a pas d'erreurs
flutter analyze

# 3. Lancer l'app
flutter run

# 4. Lancer les tests
flutter test

# 5. Build APK pour Android
flutter build apk --release

# 6. Nettoyer si problème
flutter clean && flutter pub get
```

---

## 🎨 Génération de code

```bash
# Générer des icônes d'application (avec flutter_launcher_icons)
flutter pub run flutter_launcher_icons

# Générer du code (avec build_runner)
flutter pub run build_runner build

# Surveiller et régénérer automatiquement
flutter pub run build_runner watch
```

---

## 📝 Logs et debugging

```bash
# Voir les logs en temps réel
flutter logs

# Logs avec filtre
flutter logs | grep "MonTag"

# Capturer une trace de stack
flutter logs --verbose
```

---

## 🌍 Internationalisation

```bash
# Générer les fichiers de localisation
flutter gen-l10n
```

---

## 💡 Astuces

### Raccourcis pendant `flutter run`
- `r` : Hot reload (recharge instantanée)
- `R` : Hot restart (redémarre l'app)
- `h` : Afficher l'aide
- `q` : Quitter
- `d` : Détacher (l'app continue de tourner)
- `v` : Ouvrir DevTools dans le navigateur

### Améliorer les performances de build
```bash
# Activer le cache Gradle (Android)
# Éditer ~/.gradle/gradle.properties
org.gradle.caching=true
org.gradle.parallel=true

# Augmenter la mémoire Gradle
org.gradle.jvmargs=-Xmx4096m
```

### Vérifier les mises à jour de packages
```bash
flutter pub outdated
```

---

## 🆘 Résolution de problèmes courants

### Problème : "Gradle build failed"
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Problème : "Pod install failed" (iOS)
```bash
cd ios
rm Podfile.lock
rm -rf Pods
pod install
cd ..
```

### Problème : Packages incompatibles
```bash
flutter clean
rm pubspec.lock
flutter pub get
```

### Problème : "Multiple Dart VM instances"
```bash
# Arrêter tous les processus Flutter
pkill -f flutter
```

---

## 📚 Ressources

- [Documentation officielle](https://docs.flutter.dev/)
- [Pub.dev - Packages Flutter](https://pub.dev/)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Cookbook Flutter](https://docs.flutter.dev/cookbook)

---

**Garde ce fichier comme référence ! 📌**
