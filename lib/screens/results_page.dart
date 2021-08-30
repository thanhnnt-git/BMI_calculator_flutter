import 'package:bmi_calculator/components/app_buttom.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
// import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String bmiRange;
  final String bmiInterpretation;
  final String bmiStatus;
  ResultsPage(
      {@required this.bmi,
      @required this.bmiRange,
      @required this.bmiInterpretation,
      @required this.bmiStatus});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kNumberTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiStatus.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmi,
                      style: kTitleTextStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          '$bmiStatus BMI range:',
                          style: kLableTextStyle,
                        ),
                        Text(
                          bmiRange,
                          style: kInfoTextStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65.0),
                      child: Text(
                        bmiInterpretation,
                        style: kInfoTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppButton(
                        buttonTitle: 'SAVE RESULT',
                        margin: EdgeInsets.symmetric(horizontal: 60.0),
                        color: kActiveCardColour,
                        onPress: () {})
                  ],
                ),
              ),
            ),
            AppButton(
              buttonTitle: "RE - CALCULATE YOUR BMI",
              margin: EdgeInsets.only(top: 10),
              color: kBottomContainerColour,
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
