import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class MarvelInheritedWidget extends InheritedWidget {
  final Bloc bloc;
  final Widget child;

  MarvelInheritedWidget({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static MarvelInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: MarvelInheritedWidget);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
