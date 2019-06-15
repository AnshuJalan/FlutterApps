import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  BottomButton({@required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
      ),
    );
  }
}
