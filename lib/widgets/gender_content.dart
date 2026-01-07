import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// 📚 CONCEPT FLUTTER: Custom Widget
/// Widget personnalisé pour afficher l'icône et le label du sexe

class GenderContent extends StatelessWidget {
  const GenderContent({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    /// 📚 CONCEPT FLUTTER: Column
    /// Column arrange les widgets verticalement
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
          color: kTextColor,
        ),
        const SizedBox(height: 15.0), // Espacement vertical
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
