import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          thumbColor: kBottomContainerColour,
          overlayColor: kBottomContainerColour.withOpacity(0.16),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
        primaryColor: Color(0xFF0A0C21),
        scaffoldBackgroundColor: Color(0xFF0A0C21),
      ),
      home: InputPage(),
    );
  }
}
