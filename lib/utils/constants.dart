import 'package:flutter/material.dart';

/// 📚 CONCEPT FLUTTER: Constants
/// Les constantes facilitent la maintenance et la cohérence du design.
/// Si vous voulez changer une couleur partout, modifiez-la ici une seule fois!

// ========== COULEURS ==========
/// Couleur de fond principal (dark blue/grey)
const kBackgroundColor = Color(0xFF0A0E21);

/// Couleur des cartes/containers (gris foncé)
const kCardColor = Color(0xFF1D1E33);

/// Couleur du bouton principal (rose/rouge)
const kPrimaryButtonColor = Color(0xFFEB1555);

/// Couleur des éléments actifs/sélectionnés
const kActiveColor = Color(0xFF1D1E33);

/// Couleur des éléments inactifs
const kInactiveColor = Color(0xFF111328);

/// Couleur du texte principal
const kTextColor = Color(0xFFFFFFFF);

/// Couleur du texte secondaire/labels
const kLabelTextColor = Color(0xFF8D8E98);

// ========== DIMENSIONS ==========
const double kCardBorderRadius = 10.0;
const double kCardMargin = 15.0;
const double kIconSize = 80.0;

// ========== TEXT STYLES ==========
/// 📚 CONCEPT FLUTTER: TextStyle
/// TextStyle définit l'apparence du texte (taille, couleur, poids, etc.)

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLabelTextColor,
  fontWeight: FontWeight.w400,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: kTextColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const kResultTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: kTextColor,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
  color: kTextColor,
);

// ========== DIMENSIONS SLIDER ==========
const double kMinHeight = 120.0;
const double kMaxHeight = 220.0;

// ========== DIMENSIONS AGE/WEIGHT ==========
const int kMinWeight = 30;
const int kMaxWeight = 200;
const int kMinAge = 10;
const int kMaxAge = 100;
