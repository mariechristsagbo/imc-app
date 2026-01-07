import 'package:flutter/material.dart';
import '../utils/constants.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
          color: kTextColor,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
