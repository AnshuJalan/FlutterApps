import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I am poor"),
          backgroundColor: Colors.blueGrey[800],
        ),
        backgroundColor: Colors.blueGrey[200],
        body: Center(
          child: Image(
              image: NetworkImage(
                  'https://i.ya-webdesign.com/images/coal-transparent-cartoon.png')),
        ),
      ),
    ),
  );
}
