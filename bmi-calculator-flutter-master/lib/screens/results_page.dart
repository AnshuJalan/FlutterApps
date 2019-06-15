import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_container.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final Color resultColor;
  final String interpretation;

  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation,
      @required this.resultColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: kBoldLabelStyle,
            ),
          ),
          Expanded(
            child: ReUsableContainer(
              childReUsable: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(fontSize: 25, color: resultColor),
                  ),
                  Text(
                    bmiResult,
                    style: kResultStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              color: kActiveCardColor,
            ),
          ),
          BottomButton(
            buttonText: 'RE_CALCULATE YOUR BMI',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
