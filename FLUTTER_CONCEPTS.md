# 📚 Guide d'apprentissage Flutter - Calculateur IMC

Ce document récapitule tous les concepts Flutter que tu as appris en développant cette application.

---

## 🎯 Table des matières
1. [Widgets](#widgets)
2. [Gestion d'état](#gestion-détat)
3. [Layout et positionnement](#layout-et-positionnement)
4. [Navigation](#navigation)
5. [Theming et styles](#theming-et-styles)
6. [Architecture](#architecture)
7. [Exercices pratiques](#exercices-pratiques)

---

## 1. Widgets

### StatelessWidget vs StatefulWidget

#### StatelessWidget
```dart
class MonWidget extends StatelessWidget {
  const MonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Je ne change jamais');
  }
}
```
- **Utilisation** : Pour des widgets qui ne changent jamais (affichage statique)
- **Exemple** : Texte fixe, icônes, images statiques

#### StatefulWidget
```dart
class MonWidget extends StatefulWidget {
  const MonWidget({super.key});

  @override
  State<MonWidget> createState() => _MonWidgetState();
}

class _MonWidgetState extends State<MonWidget> {
  int _compteur = 0; // Variable d'état

  @override
  Widget build(BuildContext context) {
    return Text('Compteur: $_compteur');
  }
}
```
- **Utilisation** : Pour des widgets qui changent dans le temps
- **Exemple** : Compteurs, formulaires, listes dynamiques

### Scaffold - La structure de base
```dart
Scaffold(
  appBar: AppBar(title: Text('Titre')),
  body: Center(child: Text('Contenu')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```
Composants d'un Scaffold :
- `appBar` : Barre d'en-tête
- `body` : Contenu principal
- `bottomNavigationBar` : Barre de navigation inférieure
- `floatingActionButton` : Bouton d'action flottant
- `drawer` : Menu latéral

---

## 2. Gestion d'état

### setState() - Mise à jour de l'interface
```dart
void _incrementer() {
  setState(() {
    _compteur++; // Modification de l'état
  });
  // L'UI se reconstruit automatiquement
}
```

**Règles importantes** :
- ✅ Toujours utiliser `setState()` pour modifier des variables qui affectent l'UI
- ❌ Ne jamais modifier directement sans `setState()`
- 📌 Seules les modifications dans le bloc `setState(() {})` déclenchent un rebuild

### Variables d'état dans notre app
```dart
class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;  // Sexe sélectionné
  double height = 150;     // Taille
  int weight = 60;         // Poids
  int age = 25;            // Âge
  
  // Ces variables changent via setState()
}
```

---

## 3. Layout et positionnement

### Column - Disposition verticale
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center, // Axe vertical
  crossAxisAlignment: CrossAxisAlignment.start, // Axe horizontal
  children: [
    Text('Ligne 1'),
    Text('Ligne 2'),
    Text('Ligne 3'),
  ],
)
```

### Row - Disposition horizontale
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.person),
    Text('Nom'),
    Icon(Icons.arrow_forward),
  ],
)
```

### Expanded - Prendre tout l'espace disponible
```dart
Row(
  children: [
    Expanded(flex: 2, child: Container(color: Colors.red)),
    Expanded(flex: 1, child: Container(color: Colors.blue)),
  ],
)
// Rouge prend 2/3 de l'espace, Bleu prend 1/3
```

### Container - Le couteau suisse
```dart
Container(
  width: 100,
  height: 100,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text('Contenu'),
)
```

### SizedBox - Espacement simple
```dart
Column(
  children: [
    Text('Texte 1'),
    SizedBox(height: 20), // Espace vertical de 20px
    Text('Texte 2'),
  ],
)
```

---

## 4. Navigation

### Naviguer vers un nouvel écran
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EcranDestination(
      parametre: 'valeur',
    ),
  ),
);
```

### Retourner à l'écran précédent
```dart
Navigator.pop(context);
```

### Passer des données entre écrans
```dart
// Écran source
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultScreen(
      imc: 22.5,
      message: 'Poids normal',
    ),
  ),
);

// Écran destination
class ResultScreen extends StatelessWidget {
  final double imc;
  final String message;
  
  const ResultScreen({required this.imc, required this.message});
  
  @override
  Widget build(BuildContext context) {
    return Text('IMC: $imc - $message');
  }
}
```

---

## 5. Theming et styles

### Configuration du thème global
```dart
MaterialApp(
  theme: ThemeData.dark().copyWith(
    primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF0A0E21),
    ),
  ),
)
```

### TextStyle personnalisé
```dart
const TextStyle monStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 1.2,
);

Text('Mon texte', style: monStyle);
```

### Couleurs
```dart
// Couleurs prédéfinies
Colors.red
Colors.blue.shade300

// Couleurs personnalisées (format 0xAARRGGBB)
Color(0xFFEB1555)  // FF = opacité totale, EB1555 = rouge rosé
Color(0x80FF0000)  // 80 = semi-transparent, FF0000 = rouge
```

---

## 6. Architecture

### Séparation des responsabilités

#### 1. Models - Logique métier pure
```dart
// lib/models/imc_calculator.dart
class IMCCalculator {
  static double calculateIMC({
    required double height,
    required double weight,
  }) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }
}
```

#### 2. Widgets - Composants réutilisables
```dart
// lib/widgets/custom_button.dart
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const CustomButton({required this.text, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
```

#### 3. Screens - Pages complètes
```dart
// lib/screens/home_screen.dart
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
```

#### 4. Utils - Constantes et helpers
```dart
// lib/utils/constants.dart
const Color kBackgroundColor = Color(0xFF0A0E21);
const double kCardBorderRadius = 10.0;
```

---

## 7. Exercices pratiques

### Niveau débutant 🌱

1. **Modifier les couleurs**
   - Change la couleur du bouton "CALCULATE" dans `constants.dart`
   - Change la couleur de fond de l'application

2. **Ajuster les limites**
   - Modifie la taille minimale/maximale du slider
   - Change les valeurs par défaut (poids, âge, taille)

3. **Personnaliser le texte**
   - Change le titre de l'AppBar
   - Modifie les messages d'interprétation de l'IMC

### Niveau intermédiaire 🌿

4. **Ajouter un nouveau champ**
   - Ajoute un champ "Nom" avec un TextField
   - Affiche le nom sur l'écran de résultat

5. **Historique simple**
   - Crée une List<double> pour stocker les 5 derniers IMC calculés
   - Affiche cette liste en bas de l'écran de résultat

6. **Améliorer le design**
   - Ajoute des animations lors de la navigation (Hero widget)
   - Ajoute des ombres aux cartes pour plus de profondeur

### Niveau avancé 🌳

7. **Persistance des données**
   - Utilise `shared_preferences` pour sauvegarder les derniers paramètres
   - Restaure ces valeurs au lancement de l'app

8. **Graphique d'évolution**
   - Utilise `fl_chart` pour afficher un graphique de l'évolution de l'IMC
   - Stocke l'historique avec dates

9. **Support multilingue**
   - Implémente `flutter_localizations` (anglais/français)
   - Externalise tous les textes

10. **Architecture avancée**
    - Utilise Provider ou Riverpod pour la gestion d'état
    - Sépare la logique de l'UI complètement

---

## 📝 Checklist de concepts maîtrisés

- [ ] Différence entre StatelessWidget et StatefulWidget
- [ ] Utilisation de setState() pour mettre à jour l'UI
- [ ] Création de widgets personnalisés réutilisables
- [ ] Layout avec Column, Row, Expanded
- [ ] Navigation entre écrans avec Navigator
- [ ] Passage de paramètres entre écrans
- [ ] Configuration d'un thème global
- [ ] Utilisation de const pour optimiser les performances
- [ ] Séparation models / widgets / screens / utils
- [ ] Interactivité avec GestureDetector et callbacks

---

## 🚀 Prochaines étapes

1. **Explore les widgets Material**
   - BottomSheet
   - Dialog
   - SnackBar
   - Card

2. **Apprends les animations**
   - AnimatedContainer
   - Hero
   - Tween

3. **Gestion d'état avancée**
   - Provider
   - Riverpod
   - Bloc

4. **Persistance**
   - shared_preferences
   - sqflite (base de données locale)
   - Firebase

5. **API et réseau**
   - http / dio
   - Appels REST
   - JSON parsing

---

**Continue à pratiquer et à expérimenter ! 💪**
