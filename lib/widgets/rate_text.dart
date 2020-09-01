import 'package:currency/widgets/round_field.dart';
import 'package:flutter/material.dart';

class RateTextFields extends StatelessWidget {
  const RateTextFields({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundTextField(),
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.trending_flat),
          ),
          RoundTextField(),
        ],
      ),
    );
  }
}
