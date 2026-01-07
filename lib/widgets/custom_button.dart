import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// 📚 CONCEPT FLUTTER: Custom Button
/// Bouton personnalisé réutilisable pour l'application

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    /// 📚 CONCEPT FLUTTER: GestureDetector + Container
    /// Crée un bouton personnalisé (alternative à ElevatedButton)
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPrimaryButtonColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity, // Prend toute la largeur
        height: 80.0,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
