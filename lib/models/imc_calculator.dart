/// 📚 CONCEPT FLUTTER: Enum
/// Un enum (énumération) est un type spécial qui représente un ensemble fixe de valeurs.
/// Ici, Gender ne peut avoir que deux valeurs: male ou female
enum Gender { male, female }

/// 📚 CONCEPT FLUTTER: Model Class
/// Une classe modèle encapsule la logique métier de l'application.
/// Elle sépare les calculs de l'interface utilisateur (principe de séparation des responsabilités)
class IMCCalculator {
  /// Méthode statique pour calculer l'IMC
  /// 📚 static = peut être appelée sans créer une instance de la classe
  /// Formule: IMC = poids(kg) / taille²(m)
  static double calculateIMC({
    required double height, // en cm
    required double weight, // en kg
  }) {
    // Conversion de la taille de cm en mètres
    double heightInMeters = height / 100;
    
    // Calcul de l'IMC avec 1 chiffre après la virgule
    double imc = weight / (heightInMeters * heightInMeters);
    
    return double.parse(imc.toStringAsFixed(1));
  }

  /// Méthode pour obtenir l'interprétation du résultat IMC
  static String getInterpretation(double imc) {
    if (imc <= 18.5) {
      return 'UNDERWEIGHT';
    } else if (imc < 25) {
      return 'NORMAL';
    } else {
      return 'OVERWEIGHT';
    }
  }

  /// Méthode pour obtenir le message détaillé
  static String getMessage(double imc) {
    if (imc <= 18.5) {
      return 'You have a lower than normal body weight. You should eat more!';
    } else if (imc < 25) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a higher than normal body weight. Try to exercise more!';
    }
  }

  /// Méthode pour obtenir la couleur selon le résultat
  /// Retourne un code hexadécimal de couleur
  static int getResultColor(double imc) {
    if (imc <= 18.5) {
      return 0xFF4FC3F7; // Bleu clair pour sous-poids
    } else if (imc < 25) {
      return 0xFF66BB6A; // Vert pour normal
    } else {
      return 0xFFFF7043; // Orange pour surpoids
    }
  }
}
