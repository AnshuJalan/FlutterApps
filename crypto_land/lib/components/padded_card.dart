import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  PaddedCard({
    @required this.cryptoImage,
    @required this.cryptoName,
    @required this.onPress,
  });

  final String cryptoName;
  final Image cryptoImage;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
        child: Card(
          color: Color(0xFF4853A3).withOpacity(0.2),
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ListTile(
              leading: cryptoImage,
              title: Text(
                cryptoName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
