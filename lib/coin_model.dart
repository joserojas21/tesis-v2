import 'dart:convert';
import 'package:http/http.dart' as http;

class Coin {
  final String id;
  final String name;
  final String symbol;
  final String price;
  final String percent_change_1h;

  Coin({this.id, this.name, this.symbol, this.price, this.percent_change_1h});

  Coin.frontJson(Map json):id = json['id'],
        name = json['name'],
        symbol = json['symbol'],
        price = json['price'],
        percent_change_1h = json['percent_change_1h'];

  factory Coin.fromJson(Map<String, dynamic> parsedJson) {
    return Coin(
      name: parsedJson['name'],
      symbol: parsedJson['symbol'],
      price: parsedJson['price'],
      percent_change_1h: parsedJson['percen_change_1h'],
    );
  }
}

Future<List<Coin>> getCoins() async{

  String api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=";
  String key = "00280d57-72e8-4d65-b9dd-d5a4410dec58";
  List<Coin> _jsonListMap;

  final response = await http.get(Uri.encodeFull(api + key),
      headers: {"Accept": "application/json"});
  print('datalist Response: ${response.body}');

  if(response.statusCode == 200){
    final List jsonList = json.decode(response.body);

    _jsonListMap = jsonList.map((dynamic i) => Coin.fromJson(i)).toList();

    return _jsonListMap;
  }
}