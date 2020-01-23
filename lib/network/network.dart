import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/characters_model.dart' as characters;
import '../models/comics_model.dart' as comics;
import '../models/events_model.dart' as events;
import '../models/series_model.dart' as series;
import '../network/api_url.dart';

class Network {
  ApiUrl _apiUrl = ApiUrl();

  Future<characters.CharactersData> searchCharacters(
      String charactersSearch) async {
    String url = await _apiUrl.searchCharacters(charactersSearch);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final characters.CharactersData charactersData =
      characters.CharactersData.fromJson(convert.jsonDecode(response.body));
      return charactersData;
    } else {
      throw ("Characters Search Request failed with status: ${response.statusCode}.");
    }
  }

  Future<characters.CharactersData> getCharacters(int limit,
      String order) async {
    String url = await _apiUrl.getCharactersData(limit, order);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final characters.CharactersData charactersData =
      characters.CharactersData.fromJson(convert.jsonDecode(response.body));
      return charactersData;
    } else {
      throw ("Characters Data Request failed with status: ${response.statusCode}.");
    }
  }

  Future<comics.ComicsData> getComics(String uri) async {
    String url = await _apiUrl.getData(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final comics.ComicsData comicsData =
      comics.ComicsData.fromJson(convert.jsonDecode(response.body));
      return comicsData;
    } else {
      throw ("Comics Data Request failed with status: ${response.statusCode}.");
    }
  }

  Future<events.EventsData> getEvents(String uri) async {
    String url = await _apiUrl.getData(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final events.EventsData eventsData =
      events.EventsData.fromJson(convert.jsonDecode(response.body));
      return eventsData;
    } else {
      throw ("Events Data Request failed with status: ${response.statusCode}.");
    }
  }

  Future<series.SeriesData> getSeries(String uri) async {
    String url = await _apiUrl.getData(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final series.SeriesData seriesData =
      series.SeriesData.fromJson(convert.jsonDecode(response.body));
      return seriesData;
    } else {
      throw ("Series Data Request failed with status: ${response.statusCode}.");
    }
  }
}
