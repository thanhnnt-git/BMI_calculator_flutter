import 'package:bmi_calculator/calulator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/app_buttom.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 183;
  int weight = 60;

  int age = 18;
  String bmi;
  String bmiRange;
  String bmiInterpretation;
  String bmiStatus;
  bool ageAbove18 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  //row 1
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: (selectedGender == Gender.male)
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.male,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: (selectedGender == Gender.female)
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.female,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLableTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLableTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLableTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
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
                      child: ReusableCard(
                        colour: kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLableTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                onPress: () {
                  CalculatorBrain calculatorBrain =
                      CalculatorBrain(weight, height);
                  bmi = calculatorBrain.calculateBMI();
                  bmiRange = calculatorBrain.getBMIRange();
                  bmiInterpretation = calculatorBrain.getInterpretation();
                  bmiStatus = calculatorBrain.getStatus();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi: bmi,
                              bmiRange: bmiRange,
                              bmiInterpretation: bmiInterpretation,
                              bmiStatus: bmiStatus,
                            )),
                  );
                },
                buttonTitle: 'CALCULATE YOUR BMI',
                margin: EdgeInsets.only(top: 10),
                color: kBottomContainerColour,
              )
            ],
          ),
        ));
  }
}
