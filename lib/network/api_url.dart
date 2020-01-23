import 'dart:convert' as convert;

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

import '../network/keys.dart';

const String _publicKey = "e3c52f5d7c6824864314dd04ba812237";
const String _baseUrl = "http://gateway.marvel.com/v1/public/characters";

class ApiUrl {
  Future<String> searchCharacters(String charactersSearch) async {
    final String _limit = 20.toString();
    final String _apiKey = await _getApiKey();
    String _url =
        '$_baseUrl?nameStartsWith=$charactersSearch&limit=$_limit&offset=0$_apiKey';
    return _url;
  }

  Future<String> getCharactersData(int limit, String order) async {
    final String _limit = limit.toString();
    final String _offset = 0.toString();
    final String _apiKey = await _getApiKey();
    String _url =
        '$_baseUrl?orderBy=$order&limit=$_limit&offset=$_offset$_apiKey';
    return _url;
  }

  Future<String> getData(String uri) async {
    final String _limit = 10.toString();
    final String _apiKey = await _getApiKey();
    String _url = '$_baseUrl/$uri?limit=$_limit&offset=0$_apiKey';
    return _url;
  }

  Future<String> _getApiKey() async {
    final String _timeStamp = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    final Keys _keys = await KeyLoader(keyPath: 'keys.json').load();
    final String _privateKey = _keys.privateKey;
    final String _hash = _generateMd5('$_timeStamp$_privateKey$_publicKey');
    final String _apiKey = '&apikey=$_publicKey&hash=$_hash&ts=$_timeStamp';
    return _apiKey;
  }

  String _generateMd5(String data) {
    var content = convert.Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
