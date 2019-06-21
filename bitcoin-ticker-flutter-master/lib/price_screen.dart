import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'components/padded_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<PaddedCard> paddedCardList = [];
  String cryptoPrice;

  @override
  void initState() {
    super.initState();

    setCryptoPrices(selectedCurrency);
  }

  Future<double> getPrices(String cryptoName) async {
    var cryptoData =
        await CoinData().getCryptoData('$cryptoName$selectedCurrency');
    return cryptoData['last'];
  }

  void setCryptoPrices(String currency) async {
    List<PaddedCard> tempList = [];

    for (String crypto in cryptoList) {
      double cryptoValue = await getPrices(crypto);

      tempList.add(PaddedCard(
          cryptoImage: Image.asset('images/$crypto.png'),
          cryptoName: crypto,
          cryptoPrice: cryptoValue.toStringAsFixed(1),
          selectedCurrency: currency));
    }

    setState(() {
      paddedCardList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CRYPTO LAND',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                setCryptoPrices(selectedCurrency);
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.2),
              height: 35,
              width: 70,
              margin: EdgeInsets.only(top: 10),
              child: DropdownButton(
                  value: selectedCurrency,
                  items: CoinData().getMenuItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value;
                      setCryptoPrices(value);
                    });
                  }),
            ),
            Text(
              '$cryptoPrice',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: paddedCardList,
            ),
          ],
        ),
      ),
    );
  }
}
