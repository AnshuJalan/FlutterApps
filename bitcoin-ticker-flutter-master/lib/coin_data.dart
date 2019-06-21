import 'package:flutter/material.dart';
import 'services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future getCryptoData(String symbol) async {
    String url = '$bitcoinAverageURL$symbol';
    NetworkHelper networkHelper = NetworkHelper(url);

    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }

  List<DropdownMenuItem> getMenuItems() {
    List<DropdownMenuItem> dropdownMenuItems = [];

    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownMenuItems.add(item);
    }

    return dropdownMenuItems;
  }
}
