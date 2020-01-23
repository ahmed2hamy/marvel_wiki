import 'package:flutter/material.dart';

import './bloc/bloc.dart';
import './bloc/inherited_widget.dart';
import './constants.dart';
import './screens/splash_screen.dart';

void main() => runApp(MarvelWiki());

class MarvelWiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MarvelInheritedWidget(
      bloc: Bloc(),
      child: MaterialApp(
        title: "Marvel Wiki",
        theme: kTheme,
        home: SplashScreen(),
      ),
    );
  }
}
