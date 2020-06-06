import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'E40AB1F6-0A9B-440B-A81D-08D5B011D42D';

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
  Future getCoinData(String currencyName) async {
    Map<String, String> cryptoValues = {};

    for (String crypto in cryptoList) {
      String url =
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currencyName?apikey=$apiKey';

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var rate = data['rate'];

        cryptoValues[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoValues;
  }
}
