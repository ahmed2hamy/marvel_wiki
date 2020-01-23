import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';

import '../models/characters_model.dart' as characters;
import '../models/comics_model.dart' as comics;
import '../models/events_model.dart' as events;
import '../models/series_model.dart' as series;
import '../network/network.dart';

class Bloc {
  int _limit = 20;
  String _order = "name";
  final Network _network = Network();
  HashMap<int, comics.ComicsData> _cashedComics;
  HashMap<int, events.EventsData> _cashedEvents;
  HashMap<int, series.SeriesData> _cashedSeries;

  final _characterSearchSubject = BehaviorSubject<characters.CharactersData>();
  final _characterDataSubject = BehaviorSubject<characters.CharactersData>();
  final _comicsDataSubject = BehaviorSubject<comics.ComicsData>();
  final _eventsDataSubject = BehaviorSubject<events.EventsData>();
  final _seriesDataSubject = BehaviorSubject<series.SeriesData>();
  final _searchController = StreamController<String>();
  final _orderController = StreamController<String>();
  final _apiLimitController = StreamController<int>();
  final _idController = StreamController<int>();

  Stream<characters.CharactersData> get charactersSearchStream =>
      _characterSearchSubject.stream;

  Stream<characters.CharactersData> get charactersStream =>
      _characterDataSubject.stream;

  Stream<comics.ComicsData> get comicsStream => _comicsDataSubject.stream;

  Stream<events.EventsData> get eventsStream => _eventsDataSubject.stream;

  Stream<series.SeriesData> get seriesStream => _seriesDataSubject.stream;

  Sink<String> get searchSink => _searchController.sink;

  Sink<String> get order => _orderController.sink;

  Sink<int> get apiLimitSink => _apiLimitController.sink;

  Sink<int> get getId => _idController.sink;

  close() {
    _characterSearchSubject.close();
    _characterDataSubject.close();
    _comicsDataSubject.close();
    _eventsDataSubject.close();
    _seriesDataSubject.close();
    _searchController.close();
    _orderController.close();
    _apiLimitController.close();
    _idController.close();
  }

  Bloc() {
    _cashedComics = HashMap<int, comics.ComicsData>();
    _cashedEvents = HashMap<int, events.EventsData>();
    _cashedSeries = HashMap<int, series.SeriesData>();
    _getCharacters(_limit, _order);
    _searchController.stream.listen((string) {
      _searchCharacters(string);
    });
    _orderController.stream.listen((order) {
      _order = order;
      _getCharacters(_limit, _order);
    });
    _apiLimitController.stream.listen((value) {
      _limit += value;
      _getCharacters(_limit, _order);
    });
    _idController.stream.listen((id) {
      _getComics(id);
      _getEvents(id);
      _getSeries(id);
    });
  }

  Future<void> _searchCharacters(String charactersSearch) async {
    characters.CharactersData _data =
        await _network.searchCharacters(charactersSearch);
    _characterSearchSubject.add(_data);
  }

  Future<void> _getCharacters(int limit, String order) async {
    final characters.CharactersData _data =
    await _network.getCharacters(limit, order);
    _characterDataSubject.add(_data);
  }

  Future<void> _getComics(int id) async {
    final String _comicsUri = "$id/comics";
    if (!_cashedComics.containsKey(id)) {
      comics.ComicsData _data = await _network.getComics(_comicsUri);
      _cashedComics[id] = _data;
    }
    _comicsDataSubject.add(_cashedComics[id]);
  }

  Future<void> _getEvents(int id) async {
    final String _eventsUri = "$id/events";
    if (!_cashedEvents.containsKey(id)) {
      events.EventsData _data = await _network.getEvents(_eventsUri);
      _cashedEvents[id] = _data;
    }
    _eventsDataSubject.add(_cashedEvents[id]);
  }

  Future<void> _getSeries(int id) async {
    final String _seriesUri = "$id/series";
    if (!_cashedSeries.containsKey(id)) {
      series.SeriesData _data = await _network.getSeries(_seriesUri);
      _cashedSeries[id] = _data;
    }
    _seriesDataSubject.add(_cashedSeries[id]);
  }
}
