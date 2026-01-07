import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/imc_calculator.dart';
import '../utils/constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/gender_content.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

/// 📚 CONCEPT FLUTTER: StatefulWidget
/// Un StatefulWidget peut changer son état (state) au cours de sa vie.
/// Parfait pour les formulaires, compteurs, etc.
/// 
/// Différence avec StatelessWidget:
/// - StatelessWidget = immuable, ne change pas après construction
/// - StatefulWidget = peut changer et se reconstruire avec setState()

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// 📚 CONCEPT: State Class
/// Contient les données changeantes (state) du widget
class _HomeScreenState extends State<HomeScreen> {
  // ========== VARIABLES D'ÉTAT ==========
  /// 📚 Ces variables stockent l'état actuel de l'application
  Gender? selectedGender; // Sexe sélectionné (peut être null au départ)
  double height = 150; // Taille en cm (valeur initiale)
  int weight = 60; // Poids en kg
  int age = 25; // Âge

  @override
  Widget build(BuildContext context) {
    /// 📚 CONCEPT FLUTTER: Scaffold
    /// Structure de base d'un écran Material Design
    /// Contient: AppBar, Body, FloatingActionButton, Drawer, etc.
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ========== SECTION 1: SÉLECTION DU SEXE ==========
          /// 📚 CONCEPT FLUTTER: Expanded
          /// Expanded fait qu'un widget prend tout l'espace disponible
          /// Utilise flex pour définir les proportions
          Expanded(
            child: Row(
              children: [
                // Carte MALE
                Expanded(
                  child: ReusableCard(
                    /// 📚 CONCEPT: Opérateur ternaire
                    /// condition ? valeurSiVrai : valeurSiFaux
                    colour: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: const GenderContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      /// 📚 CONCEPT FLUTTER: setState()
                      /// setState() notifie Flutter qu'une donnée a changé
                      /// et déclenche un rebuild du widget
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                // Carte FEMALE
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: const GenderContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // ========== SECTION 2: SLIDER DE TAILLE ==========
          Expanded(
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  /// 📚 CONCEPT FLUTTER: Slider
                  /// Widget interactif pour sélectionner une valeur dans un intervalle
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kLabelTextColor,
                      thumbColor: kPrimaryButtonColor,
                      overlayColor: kPrimaryButtonColor.withValues(alpha: 0.16),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height,
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ========== SECTION 3: POIDS ET ÂGE ==========
          Expanded(
            child: Row(
              children: [
                // Carte WEIGHT
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Bouton -
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > kMinWeight) weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            // Bouton +
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (weight < kMaxWeight) weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Carte AGE
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > kMinAge) age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < kMaxAge) age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ========== BOUTON CALCULATE ==========
          CustomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // Calculer l'IMC
              double imc = IMCCalculator.calculateIMC(
                height: height,
                weight: weight.toDouble(),
              );

              /// 📚 CONCEPT FLUTTER: Navigation
              /// Navigator.push() permet de naviguer vers un nouvel écran
              /// Il empile le nouvel écran sur l'ancien (comme une pile de cartes)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: imc,
                    resultText: IMCCalculator.getInterpretation(imc),
                    interpretation: IMCCalculator.getMessage(imc),
                    resultColor: Color(IMCCalculator.getResultColor(imc)),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
