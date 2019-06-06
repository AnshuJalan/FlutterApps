import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DicePage());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieValue = 1, rightDieValue = 1;

  void rollDice() {
    setState(() {
      leftDieValue = Random().nextInt(6) + 1;
      rightDieValue = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: rollDice,
                      child: Image.asset('images/dice$leftDieValue.png'))),
              Expanded(
                child: FlatButton(
                    onPressed: rollDice,
                    child: Image.asset('images/dice$rightDieValue.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
