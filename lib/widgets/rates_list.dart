import 'dart:math';

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
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 60,
                    child: IconButton(
                      icon: Icon(Icons.attach_money),
                      onPressed: null,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment(-0.25, 0.5),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$currency",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${rates[currency]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
