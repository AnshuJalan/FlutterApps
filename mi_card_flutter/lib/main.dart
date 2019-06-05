import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/anshu.jpeg'),
              ),
              Text('Anshu Jalan',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text('ENTREPRENEUR',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                    color: Colors.teal[100],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  )),
              SizedBox(
                height: 20,
                width: 140,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text('+91 9674616184',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SourceSansPro',
                              color: Colors.teal)))),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'anshujalan206@gmail.com',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SourceSansPro',
                          color: Colors.teal),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
