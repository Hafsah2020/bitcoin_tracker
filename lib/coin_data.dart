import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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

class CoinData {
  String home = 'https://rest.coinapi.io/v1/exchangerate';
  String api = '11F4495F-9900-4B01-92C8-B25D3FA4ABAC';

  Future getData(String currency, String crypto) async {
    String url = '$home/$crypto/$currency?apikey=$api';
    http.Response data = await http.get(Uri.parse(url));
    if (data.statusCode == 200) {
      String dataBody = data.body;
      return jsonDecode(dataBody);
    } else {
      print('${data.statusCode}');
    }
  }
}
