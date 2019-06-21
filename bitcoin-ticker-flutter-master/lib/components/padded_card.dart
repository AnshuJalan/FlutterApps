import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  PaddedCard({
    @required this.cryptoImage,
    @required this.cryptoName,
    @required this.cryptoPrice,
    @required this.selectedCurrency,
  });

  final String cryptoName;
  final String cryptoPrice;
  final String selectedCurrency;
  final Image cryptoImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: ListTile(
            leading: cryptoImage,
            title: Text(
              '1 $cryptoName = $cryptoPrice $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
