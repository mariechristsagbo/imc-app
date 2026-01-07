import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// 📚 CONCEPT FLUTTER: Reusable Component
/// Widget réutilisable pour afficher et modifier des valeurs numériques (âge, poids)

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// 📚 CONCEPT FLUTTER: RawMaterialButton
    /// Bouton Material personnalisable (forme, taille, couleur)
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0, // Pas d'ombre
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(), // Forme circulaire
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: kTextColor,
      ),
    );
  }
}
