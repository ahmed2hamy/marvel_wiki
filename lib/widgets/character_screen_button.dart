import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../models/characters_model.dart' as characters;

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.result,
    @required this.urlType,
    @required this.title,
  }) : super(key: key);

  final characters.Result result;
  final characters.UrlType urlType;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final characters.Result _result = result;
        final int _ind = _result.urls.indexWhere((e) => e.type == urlType);
        _launchUrl(_result.urls[_ind].url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: kHeadlineWhite.copyWith(fontSize: 24),
            ),
            ImageIcon(
              AssetImage('assets/icn-cell-disclosure.png'),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
