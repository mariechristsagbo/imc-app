enum Gender { male, female }

class IMCCalculator {
  static double calculateIMC({
    required double height, // en cm
    required double weight, // en kg
  }) {
    double heightInMeters = height / 100;
    double imc = weight / (heightInMeters * heightInMeters);
    return double.parse(imc.toStringAsFixed(1));
  }

  static String getInterpretation(double imc) {
    if (imc <= 18.5) {
      return 'UNDERWEIGHT';
    } else if (imc < 25) {
      return 'NORMAL';
    } else {
      return 'OVERWEIGHT';
    }
  }

  static String getMessage(double imc) {
    if (imc <= 18.5) {
      return 'You have a lower than normal body weight. You should eat more!';
    } else if (imc < 25) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a higher than normal body weight. Try to exercise more!';
    }
  }

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
