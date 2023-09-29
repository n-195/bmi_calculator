import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/bmi_calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card_widget.dart';
import '../components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // In Dart, when you declare a non-nullable variable like selectedGender,
  // you need to initialize it with a non-null value. Since you want to start
  // with selectedGender as null, you can make the variable nullable by adding
  // a ? after the type declaration like this:
  Gender? selectedGender;
  int height = 180;
  int weight = 88;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                // Male Card
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(FontAwesomeIcons.mars, 'male'),
                  ),
                ),

                // Female Card
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        const IconContent(FontAwesomeIcons.venus, 'female'),
                  ),
                ),
              ],
            ),
          ),

          // Center card, slider widget
          Expanded(
            child: CardWidget(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kFontTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25.0),
                        thumbColor: kSliderThumbColor,
                        activeTrackColor: kSliderActiveTrackColor,
                        inactiveTrackColor: kSliderInactiveTrackColor,
                        overlayColor: kThumbOverlayColor,
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 110.0,
                          max: 221.0,
                          // activeColor property overrides the thumb color property.
                          // activeColor: const Color(0xFFFFFFFF),

                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardWidget(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kFontTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kFontTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // The error you're encountering, "Reference to an enclosing class
          // method cannot be extracted," occurs because you're trying to
          // extract the GestureDetector widget, which includes a call to setState,
          // and the Navigator.push method. The setState method is typically used
          // to update the state of the current widget, and the Navigator.push
          // method is used to navigate to another screen. These methods rely on
          // the context and state of the current widget and cannot be easily
          // extracted as a separate widget. Simply remove the setState and error should resolve.
          BottomButton(
            onTap: () {
              BMICalculatorBrain calc =
                  BMICalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation()),
                ),
              );
            },
            buttonTitle: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
