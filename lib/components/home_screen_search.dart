import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../bloc/inherited_widget.dart';
import '../constants.dart';
import '../models/characters_model.dart' as characters;
import '../screens/character_screen.dart';

class MarvelSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => "Search Characters";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.all(8),
        child: IconButton(
            icon: ImageIcon(
              AssetImage('assets/icn-nav-close-white.png'),
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              close(context, null);
              query = "";
            }),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ImageIcon(
        AssetImage('assets/icn-nav-search.png'),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != "") {
      MarvelInheritedWidget.of(context).bloc.searchSink.add(query);
      return SearchResults(query: query);
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != "") {
      MarvelInheritedWidget.of(context).bloc.searchSink.add(query);
      return SearchResults(query: query);
    } else {
      return Container();
    }
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key key,
    @required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<characters.CharactersData>(
        stream: MarvelInheritedWidget.of(context).bloc.charactersSearchStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _results = snapshot.data.data.results
                .where((c) => c.name.toLowerCase().contains(query));
            return ListView(
              children: _results.map((a) {
                final String _imageExtension = a.thumbnail.extension;
                final String _imageUrl =
                    a.thumbnail.path + '.' + _imageExtension;

                if (_imageUrl.contains("image_not_available") ||
                    _imageUrl.isEmpty) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(18),
                    child: InkWell(
                      onTap: () {
                        final List<characters.Result> _resultsList =
                            _results.toList();
                        final int _resultIndex = _resultsList.indexOf(a);
                        final characters.Result _result =
                            _resultsList[_resultIndex];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterScreen(result: _result),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: _imageUrl,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.fill,
                            imageBuilder: (context, imageProvider) {
                              return CircleAvatar(
                                radius: 50,
                                backgroundImage: imageProvider,
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  a.name,
                                  style: kHeadlineWhite,
                                  maxLines: 3,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  a.description,
                                  style: kHeadlineWhite.copyWith(fontSize: 12),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }).toList(),
            );
          } else {
            return Container();
          }
        });
  }
}
