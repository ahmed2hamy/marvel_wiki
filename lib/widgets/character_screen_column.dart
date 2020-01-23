import 'package:flutter/material.dart';

import '../constants.dart';

class ColumnCard extends StatelessWidget {
  final Widget child;
  final String title;

  const ColumnCard({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 18),
          child: Text(title, style: kHeadlineRed),
        ),
        Container(height: 0.5 * x, width: x, child: child),
      ],
    );
  }
}
