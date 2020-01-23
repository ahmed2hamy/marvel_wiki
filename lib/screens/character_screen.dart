import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../bloc/inherited_widget.dart';
import '../constants.dart';
import '../models/characters_model.dart' as characters;
import '../models/comics_model.dart' as comics;
import '../models/events_model.dart' as events;
import '../models/series_model.dart' as series;
import '../widgets/character_screen_button.dart';
import '../widgets/character_screen_column.dart';
import '../widgets/custom_cached_image.dart';

class CharacterScreen extends StatelessWidget {
  final characters.Result result;

  const CharacterScreen({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double x = MediaQuery
        .of(context)
        .size
        .width;
    final Bloc _bloc = MarvelInheritedWidget
        .of(context)
        .bloc;
    final characters.Result _result = result;
    final String _imageExtension = _result.thumbnail.extension;
    final String _imageUrl = _result.thumbnail.path + '.' + _imageExtension;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 0.8 * x,
              title: Text(_result.name),
              centerTitle: true,
              leading: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icn-nav-back-white.png'),
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              flexibleSpace: FlexibleSpaceBar(
                background: customCachedNetworkImage(_imageUrl),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("NAME", style: kHeadlineRed),
                        SizedBox(height: 8),
                        Text(
                          _result.name,
                          style: kHeadlineWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("DESCRIPTION", style: kHeadlineRed),
                        SizedBox(height: 8),
                        Text(
                          _result.description.isEmpty
                              ? "No Data on ${_result.name}"
                              : _result.description,
                          style: kHeadlineWhite,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<comics.ComicsData>(
                    stream: _bloc.comicsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<comics.Result> _results =
                            snapshot.data.data.results;
                        if (_results.length == 0) {
                          return ColumnCard(
                            title: "COMICS",
                            child: Center(
                              child: Text(
                                "No available Comics on ${_result.name}",
                                style: kHeadlineWhite,
                              ),
                            ),
                          );
                        } else {
                          return ColumnCard(
                            title: "COMICS",
                            child: ListView.builder(
                                key: PageStorageKey(
                                    snapshot.data.hashCode.toString()),
                                scrollDirection: Axis.horizontal,
                                itemCount: _results.length,
                                itemBuilder: (context, ind) {
                                  final String _imageExtension =
                                      _results[ind].thumbnail.extension;
                                  final String _imageUrl =
                                      _results[ind].thumbnail.path +
                                          '.' +
                                          _imageExtension;
                                  return Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: FittedBox(
                                      child: Column(
                                        children: <Widget>[
                                          customCachedNetworkImage(_imageUrl),
                                          SizedBox(height: 8),
                                          Text(
                                            _results[ind].title,
                                            style: kHeadlineWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "No available Comics on ${_result.name}",
                            style: kHeadlineWhite,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  StreamBuilder<events.EventsData>(
                    stream: _bloc.eventsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<events.Result> _results =
                            snapshot.data.data.results;
                        if (_results.length == 0) {
                          return ColumnCard(
                            title: "EVENTS",
                            child: Center(
                              child: Text(
                                "No available Events on ${_result.name}",
                                style: kHeadlineWhite,
                              ),
                            ),
                          );
                        } else {
                          return ColumnCard(
                            title: "EVENTS",
                            child: ListView.builder(
                                key: PageStorageKey(
                                    snapshot.data.hashCode.toString()),
                                scrollDirection: Axis.horizontal,
                                itemCount: _results.length,
                                itemBuilder: (context, ind) {
                                  final String _imageExtension =
                                      _results[ind].thumbnail.extension;
                                  final String _imageUrl =
                                      _results[ind].thumbnail.path +
                                          '.' +
                                          _imageExtension;
                                  return Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: FittedBox(
                                      child: Column(
                                        children: <Widget>[
                                          customCachedNetworkImage(_imageUrl),
                                          SizedBox(height: 8),
                                          Text(
                                            _results[ind].title,
                                            style: kHeadlineWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "No available Events on ${_result.name}",
                            style: kHeadlineWhite,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  StreamBuilder<series.SeriesData>(
                    stream: _bloc.seriesStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<series.Result> _results =
                            snapshot.data.data.results;
                        if (_results.length == 0) {
                          return ColumnCard(
                            title: "SERIES",
                            child: Center(
                              child: Text(
                                "No available Series on ${_result.name}",
                                style: kHeadlineWhite,
                              ),
                            ),
                          );
                        } else {
                          return ColumnCard(
                            title: "SERIES",
                            child: ListView.builder(
                                key: PageStorageKey(
                                    snapshot.data.hashCode.toString()),
                                scrollDirection: Axis.horizontal,
                                itemCount: _results.length,
                                itemBuilder: (context, ind) {
                                  final String _imageExtension =
                                      _results[ind].thumbnail.extension;
                                  final String _imageUrl =
                                      _results[ind].thumbnail.path +
                                          '.' +
                                          _imageExtension;
                                  return Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: FittedBox(
                                      child: Column(
                                        children: <Widget>[
                                          customCachedNetworkImage(_imageUrl),
                                          SizedBox(height: 8),
                                          Text(
                                            _results[ind].title,
                                            style: kHeadlineWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "No available Series on ${_result.name}",
                            style: kHeadlineWhite,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: Text("RELATED LINKS", style: kHeadlineRed),
                  ),
                  CustomButton(
                    result: _result,
                    title: "Details",
                    urlType: characters.UrlType.DETAIL,
                  ),
                  SizedBox(height: 8),
                  CustomButton(
                    result: _result,
                    title: "Wiki",
                    urlType: characters.UrlType.WIKI,
                  ),
                  SizedBox(height: 8),
                  CustomButton(
                    result: _result,
                    title: "Comick Link",
                    urlType: characters.UrlType.COMICLINK,
                  ),
                  SizedBox(height: 82),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
