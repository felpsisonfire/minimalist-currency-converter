import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Rate {
  String base;
  String date;

  dynamic rates = Map();

  Rate({this.base, this.date, this.rates});

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      base: json['base'],
      date: json['date'],
      rates: json['rates'],
    );
  }
}

Future<Rate> fetchRates() async {
  final response = await http.get('https://api.ratesapi.io/api/latest');
  if (response.statusCode == 200) {
    return Rate.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch data');
  }
}
