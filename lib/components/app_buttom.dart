import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {@required this.buttonTitle,
      @required this.onPress,
      this.margin,
      this.color});
  final String buttonTitle;
  final Function onPress;
  final EdgeInsetsGeometry margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: margin,
        color: color,
      ),
    );
  }
}
