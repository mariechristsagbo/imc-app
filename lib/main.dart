import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';

/// 📚 CONCEPT FLUTTER: main()
/// Point d'entrée de l'application Flutter
/// runApp() prend un widget et en fait la racine de l'application
void main() {
  runApp(const BMICalculatorApp());
}

/// 📚 CONCEPT FLUTTER: MaterialApp
/// Widget racine qui configure le thème, les routes, le titre de l'app, etc.
class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Configuration de l'application
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false, // Retire le bandeau "DEBUG"
      
      /// 📚 CONCEPT FLUTTER: Theme
      /// ThemeData définit les couleurs et styles par défaut de l'app
      /// Permet de garder un design cohérent partout
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
      ),
      
      /// 📚 CONCEPT: Home Screen
      /// Premier écran affiché au lancement de l'app
      home: const HomeScreen(),
    );
  }
}
