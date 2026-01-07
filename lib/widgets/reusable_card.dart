import 'package:flutter/material.dart';

/// 📚 CONCEPT FLUTTER: Reusable Widget
/// Un widget réutilisable peut être utilisé à plusieurs endroits avec des paramètres différents.
/// Cela respecte le principe DRY (Don't Repeat Yourself)

class ReusableCard extends StatelessWidget {
  /// 📚 CONCEPT: Constructor avec paramètres nommés
  /// 'required' indique que le paramètre est obligatoire
  /// Le '?' rend le paramètre optionnel (nullable)
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardChild,
    this.onPress,
  });

  final Color colour;
  final Widget? cardChild; // Widget enfant affiché dans la carte
  final VoidCallback? onPress; // Fonction appelée au tap

  @override
  Widget build(BuildContext context) {
    /// 📚 CONCEPT FLUTTER: GestureDetector
    /// Détecte les gestes (tap, double-tap, swipe, etc.)
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
