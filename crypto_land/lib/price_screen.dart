import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'components/padded_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'utilities/constants.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCrypto = 'BTC';
  String cryptoPrice = '000000.0';
  String priceChange = '0000.0';
  String percentChange = '0';
  Color changeColor = Colors.green;
  Icon changeIcon = Icon(
    Icons.arrow_drop_up,
    color: Colors.green,
    size: 40,
  );
  double spinnerOpacity = 0;

  @override
  void initState() {
    super.initState();

    getRates(selectedCrypto);
  }

  Future getRates(String cryptoName) async {
    spinnerOpacity = 0.7;
    var cryptoData =
        await CoinData().getCryptoData('$cryptoName$selectedCurrency');
    setState(() {
      cryptoPrice = cryptoData['last'].toStringAsFixed(1);
      priceChange = cryptoData['changes']['price']['month'].toStringAsFixed(1);
      percentChange =
          cryptoData['changes']['percent']['month'].toStringAsFixed(1);
      if (double.parse(priceChange) > 0) {
        changeColor = Colors.green;
        changeIcon = Icon(
          Icons.arrow_drop_up,
          color: Colors.green,
          size: 40,
        );
      } else {
        changeColor = Colors.red;
        changeIcon = Icon(
          Icons.arrow_drop_down,
          color: Colors.red,
          size: 40,
        );
      }
    });
    spinnerOpacity = 0;
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
                setState(() {
                  getRates(selectedCrypto);
                });
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
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        selectedCrypto,
                        style: TextStyle(
                            fontSize: 45, color: Colors.white.withOpacity(0.7)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SpinKitRing(
                        color: Colors.redAccent.withOpacity(spinnerOpacity),
                        size: 35,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
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
                            getRates(selectedCrypto);
                          });
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    FlutterMoneyFormatter(
                      amount: double.parse(cryptoPrice),
                      settings: MoneyFormatterSettings(
                          decimalSeparator: '.', thousandSeparator: ','),
                    ).output.nonSymbol,
                    style: kCryptoPriceStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      changeIcon,
                      Text(
                        "${FlutterMoneyFormatter(
                          amount: double.parse(priceChange),
                          settings: MoneyFormatterSettings(
                              decimalSeparator: '.', thousandSeparator: ','),
                        ).output.nonSymbol} ($percentChange%)",
                        style: TextStyle(fontSize: 20, color: changeColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'last month',
                        style: kCryptoChangePeriodText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: 150,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 12, 12, 12),
                child: Text(
                  'Crptyocurrencies',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                PaddedCard(
                  cryptoImage: Image.asset('images/BTC.png'),
                  cryptoName: 'Bitcoin',
                  onPress: () {
                    setState(() {
                      selectedCrypto = 'BTC';
                      getRates('BTC');
                    });
                  },
                ),
                PaddedCard(
                  cryptoImage: Image.asset('images/ETH.png'),
                  cryptoName: 'Ethereum',
                  onPress: () {
                    setState(() {
                      getRates('ETH');
                      selectedCrypto = 'ETH';
                    });
                  },
                ),
                PaddedCard(
                  cryptoImage: Image.asset('images/LTC.png'),
                  cryptoName: 'Litecoin',
                  onPress: () {
                    setState(() {
                      selectedCrypto = 'LTC';
                      getRates('LTC');
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
