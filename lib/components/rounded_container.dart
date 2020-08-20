import 'package:currency/components/models/fetch_rates.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatefulWidget {
  const RoundContainer({
    Key key,
  }) : super(key: key);

  @override
  _RoundContainerState createState() => _RoundContainerState();
}

class _RoundContainerState extends State<RoundContainer> {
  Future<Rate> futureRate;

  @override
  void initState() {
    super.initState();
    futureRate = fetchRates();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Rate>(
          future: futureRate,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text("1 EUR: ${snapshot.data.rates['BRL']} BRL"),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE5E5E5),
        ),
      ),
    );
  }
}
