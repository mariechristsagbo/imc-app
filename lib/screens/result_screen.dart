import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/custom_button.dart';

/// 📚 CONCEPT FLUTTER: Screen Navigation
/// Cet écran reçoit des données de l'écran précédent via son constructeur

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
    required this.resultColor,
  });

  /// 📚 CONCEPT: Final variables
  /// Ces variables sont initialisées une fois et ne changent plus
  final double bmiResult;
  final String resultText;
  final String interpretation;
  final Color resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Titre "Your Result"
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),

          // Carte avec le résultat
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Statut (NORMAL, OVERWEIGHT, UNDERWEIGHT)
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle.copyWith(
                      color: resultColor,
                    ),
                  ),
                  // Valeur de l'IMC
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: kBMITextStyle,
                  ),
                  // Message d'interprétation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bouton RE-CALCULATE
          CustomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              /// 📚 CONCEPT FLUTTER: Navigation Back
              /// Navigator.pop() retire l'écran actuel de la pile
              /// et retourne à l'écran précédent
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
