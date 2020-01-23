import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class KeyLoader {
  final String keyPath;

  KeyLoader({this.keyPath});

  Future<Keys> load() {
    return rootBundle.loadStructuredData<Keys>(this.keyPath, (jsonStr) async {
      final Keys key = Keys.fromJson(json.decode(jsonStr));
      return key;
    });
  }
}

class Keys {
  final String privateKey;

  Keys({this.privateKey = ""});

  factory Keys.fromJson(Map<String, dynamic> jsonMap) {
    return Keys(privateKey: jsonMap["private_key"]);
  }
}
