import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blue[400],
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  int questionsAsked = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Questions asked: $questionsAsked',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            Container(
              color: Colors.blueGrey[900],
              width: 40,
              height: 40,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.refresh,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    questionsAsked = 0;
                  });
                },
              ),
            ),
          ],
        ),
        FlatButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
              questionsAsked++;
            });
          },
        ),
      ],
    );
  }
}
