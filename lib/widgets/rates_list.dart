import 'package:flutter/material.dart';
import 'package:currency/models/fetch_rates.dart';

class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  Future<Rate> futureRate;

  @override
  void initState() {
    super.initState();
    futureRate = fetchRates();
  }

  Widget buildRateList(Map<String, dynamic> rates) {
    return ListView.builder(
      itemCount: rates.length,
      itemBuilder: (context, index) {
        String currency = rates.keys.elementAt(index);
        return Container(
          height: 60.0,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$currency"),
              Text("${rates[currency]}"),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Rate>(
        future: futureRate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildRateList(snapshot.data.rates);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
