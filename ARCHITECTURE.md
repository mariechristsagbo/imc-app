# 🏗️ Architecture de l'application IMC

## 📁 Structure complète du projet

```
imc_app/
│
├── lib/                              # Code source Dart
│   ├── main.dart                     # Point d'entrée - Configure MaterialApp
│   │
│   ├── models/                       # Logique métier (calculs purs)
│   │   └── imc_calculator.dart       # Calculs IMC, interprétations
│   │
│   ├── screens/                      # Pages complètes de l'application
│   │   ├── home_screen.dart          # Écran de saisie (StatefulWidget)
│   │   └── result_screen.dart        # Écran de résultat (StatelessWidget)
│   │
│   ├── widgets/                      # Composants UI réutilisables
│   │   ├── custom_button.dart        # Bouton CALCULATE/RE-CALCULATE
│   │   ├── gender_content.dart       # Icône + label pour MALE/FEMALE
│   │   ├── reusable_card.dart        # Carte avec GestureDetector
│   │   └── round_icon_button.dart    # Boutons circulaires +/-
│   │
│   └── utils/                        # Utilitaires et constantes
│       └── constants.dart            # Couleurs, styles, limites
│
├── test/                             # Tests unitaires et widget
│   └── widget_test.dart              # Test de base de l'UI
│
├── android/                          # Configuration Android
├── ios/                              # Configuration iOS
├── web/                              # Configuration Web
├── linux/                            # Configuration Linux
├── macos/                            # Configuration macOS
├── windows/                          # Configuration Windows
│
├── pubspec.yaml                      # Dépendances et métadonnées
├── analysis_options.yaml             # Configuration du linter
├── README.md                         # Documentation principale
├── FLUTTER_CONCEPTS.md               # Guide d'apprentissage
└── COMMANDES_FLUTTER.md              # Référence des commandes
```

---

## 🔄 Flux de données

```
┌─────────────────────────────────────────────────────────────┐
│                        main.dart                            │
│  ┌──────────────────────────────────────────────────────┐   │
│  │          BMICalculatorApp (StatelessWidget)          │   │
│  │  • Configure le thème global (couleurs, styles)      │   │
│  │  • Définit HomeScreen comme écran de démarrage       │   │
│  └───────────────────────────┬──────────────────────────┘   │
└────────────────────────────────┼────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────┐
│              screens/home_screen.dart                       │
│  ┌──────────────────────────────────────────────────────┐   │
│  │          HomeScreen (StatefulWidget)                 │   │
│  │  • État: gender, height, weight, age                 │   │
│  │  • Widgets:                                          │   │
│  │    - 2x ReusableCard pour sélection sexe            │   │
│  │    - 1x ReusableCard avec Slider (taille)           │   │
│  │    - 2x ReusableCard avec compteurs +/- (poids,âge) │   │
│  │    - 1x CustomButton (CALCULATE)                     │   │
│  │                                                      │   │
│  │  • Action: onTap CALCULATE →                        │   │
│  │    1. Appelle IMCCalculator.calculateIMC()          │   │
│  │    2. Navigator.push() vers ResultScreen            │   │
│  └───────────────────────────┬──────────────────────────┘   │
└────────────────────────────────┼────────────────────────────┘
                                 │
                                 │ Navigator.push()
                                 │ (avec paramètres: imc, texte, message)
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────┐
│             screens/result_screen.dart                      │
│  ┌──────────────────────────────────────────────────────┐   │
│  │         ResultScreen (StatelessWidget)               │   │
│  │  • Reçoit: bmiResult, resultText, interpretation     │   │
│  │  • Affiche:                                          │   │
│  │    - Titre "Your Result"                             │   │
│  │    - Statut coloré (NORMAL/OVERWEIGHT/UNDERWEIGHT)  │   │
│  │    - Valeur IMC (grande police)                      │   │
│  │    - Message d'interprétation                        │   │
│  │    - CustomButton (RE-CALCULATE)                     │   │
│  │                                                      │   │
│  │  • Action: onTap RE-CALCULATE →                     │   │
│  │    Navigator.pop() retour à HomeScreen              │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧩 Relations entre composants

### 1. **main.dart** (racine)
```
BMICalculatorApp
    └── MaterialApp
        └── home: HomeScreen()
```

### 2. **HomeScreen** (écran principal)
```
HomeScreen (StatefulWidget)
    └── _HomeScreenState
        ├── Variables d'état
        │   ├── selectedGender (Gender?)
        │   ├── height (double)
        │   ├── weight (int)
        │   └── age (int)
        │
        └── UI (Column)
            ├── Row: Sélection sexe
            │   ├── ReusableCard (MALE)
            │   │   └── GenderContent(icon, label)
            │   └── ReusableCard (FEMALE)
            │       └── GenderContent(icon, label)
            │
            ├── ReusableCard: Slider taille
            │   └── Column
            │       ├── Text('HEIGHT')
            │       ├── Row: valeur + "cm"
            │       └── Slider
            │
            ├── Row: Poids et âge
            │   ├── ReusableCard (WEIGHT)
            │   │   └── Column
            │   │       ├── Text('WEIGHT')
            │   │       ├── Text(valeur)
            │   │       └── Row: boutons +/-
            │   │           ├── RoundIconButton (-)
            │   │           └── RoundIconButton (+)
            │   │
            │   └── ReusableCard (AGE)
            │       └── Column (même structure que WEIGHT)
            │
            └── CustomButton ('CALCULATE')
                └── onTap: Navigation vers ResultScreen
```

### 3. **ResultScreen** (écran résultat)
```
ResultScreen (StatelessWidget)
    └── Column
        ├── Text("Your Result")
        ├── ReusableCard
        │   └── Column
        │       ├── Text(resultText) // NORMAL/OVERWEIGHT/etc.
        │       ├── Text(bmiResult)  // 19.2
        │       └── Text(interpretation) // Message détaillé
        │
        └── CustomButton ('RE-CALCULATE')
            └── onTap: Navigator.pop()
```

---

## 🎨 Widgets réutilisables détaillés

### ReusableCard
- **Rôle** : Container stylisé avec gestionnaire de tap
- **Props** : `colour`, `cardChild`, `onPress`
- **Utilisations** : Cartes de sélection sexe, taille, poids, âge, résultat

### GenderContent
- **Rôle** : Affiche icône + label pour MALE/FEMALE
- **Props** : `icon`, `label`
- **Parent** : ReusableCard (sélection sexe)

### CustomButton
- **Rôle** : Bouton pleine largeur avec style personnalisé
- **Props** : `buttonTitle`, `onTap`
- **Utilisations** : CALCULATE, RE-CALCULATE

### RoundIconButton
- **Rôle** : Bouton circulaire pour incrémenter/décrémenter
- **Props** : `icon`, `onPressed`
- **Parent** : ReusableCard (poids, âge)

---

## 💾 Gestion d'état

### État local (HomeScreen)
```dart
class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;  // null au départ
  double height = 150;     // valeur par défaut
  int weight = 60;         // valeur par défaut
  int age = 25;            // valeur par défaut
  
  // Modification via setState()
  void _updateGender(Gender newGender) {
    setState(() {
      selectedGender = newGender;
    });
  }
}
```

### Passage de données (Navigation)
```dart
// HomeScreen → ResultScreen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultScreen(
      bmiResult: calculatedIMC,
      resultText: interpretation,
      interpretation: message,
      resultColor: color,
    ),
  ),
);
```

---

## 🧮 Logique métier (IMCCalculator)

```
IMCCalculator (classe statique)
    │
    ├── calculateIMC(height, weight) → double
    │   └── Formule: poids / (taille_en_m)²
    │
    ├── getInterpretation(imc) → String
    │   ├── imc ≤ 18.5 → "UNDERWEIGHT"
    │   ├── 18.5 < imc < 25 → "NORMAL"
    │   └── imc ≥ 25 → "OVERWEIGHT"
    │
    ├── getMessage(imc) → String
    │   └── Retourne un message détaillé
    │
    └── getResultColor(imc) → int (hexa)
        ├── Sous-poids → 0xFF4FC3F7 (bleu)
        ├── Normal → 0xFF66BB6A (vert)
        └── Surpoids → 0xFFFF7043 (orange)
```

---

## 🎨 Système de design (constants.dart)

### Couleurs
```
kBackgroundColor     : 0xFF0A0E21 (bleu foncé)
kCardColor           : 0xFF1D1E33 (gris foncé)
kPrimaryButtonColor  : 0xFFEB1555 (rose/rouge)
kActiveColor         : 0xFF1D1E33 (carte active)
kInactiveColor       : 0xFF111328 (carte inactive)
kTextColor           : 0xFFFFFFFF (blanc)
kLabelTextColor      : 0xFF8D8E98 (gris clair)
```

### Styles de texte
```
kLabelTextStyle      : 18px, normal
kNumberTextStyle     : 50px, gras
kTitleTextStyle      : 50px, gras
kResultTextStyle     : 22px, gras
kBMITextStyle        : 100px, gras
kBodyTextStyle       : 22px, normal
```

### Limites
```
Taille : 120cm - 220cm
Poids  : 30kg - 200kg
Âge    : 10 - 100
```

---

## 🚀 Points clés de l'architecture

### ✅ Avantages
1. **Séparation des responsabilités** : Models, Screens, Widgets, Utils
2. **Réutilisabilité** : Widgets génériques (ReusableCard, CustomButton)
3. **Maintenabilité** : Constantes centralisées, code commenté
4. **Lisibilité** : Structure claire, nommage explicite
5. **Testabilité** : Logique métier isolée dans IMCCalculator

### 🎯 Principes appliqués
- **DRY** (Don't Repeat Yourself) : Widgets réutilisables
- **Single Responsibility** : Chaque fichier a une responsabilité unique
- **Composition over Inheritance** : Utilisation de widgets composés
- **Separation of Concerns** : UI ≠ Logique métier

---

## 🔮 Évolutions possibles

### Court terme
- [ ] Validation des entrées (poids/âge dans les limites)
- [ ] Animations de transition entre écrans
- [ ] Feedback visuel sur sélection (vibration, son)

### Moyen terme
- [ ] Historique des calculs (liste locale)
- [ ] Graphique d'évolution de l'IMC
- [ ] Partage du résultat (image, texte)
- [ ] Support multilingue (i18n)

### Long terme
- [ ] Backend Firebase (authentification, sync cloud)
- [ ] Objectifs et suivi (notifications)
- [ ] Recommandations personnalisées
- [ ] Export PDF des données

---

**Cette architecture est conçue pour être évolutive et maintenable ! 🚀**
