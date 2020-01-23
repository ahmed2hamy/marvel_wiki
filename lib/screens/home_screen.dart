import 'package:flutter/material.dart';

import '../bloc/inherited_widget.dart';
import '../components/home_screen_bottom_sheet.dart';
import '../components/home_screen_characters_builder.dart';
import '../components/home_screen_search.dart';
import '../models/characters_model.dart' as characters;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        MarvelInheritedWidget.of(context).bloc.apiLimitSink.add(20);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 32,
            ),
            onPressed: () {
              bottomSheet(context, _scrollController);
            }),
        title: Image.asset('assets/icn-nav-marvel.png', height: 40),
        actions: <Widget>[
          IconButton(
              icon: ImageIcon(
                AssetImage('assets/icn-nav-search.png'),
              ),
              onPressed: () {
                showSearch(context: context, delegate: MarvelSearch());
              }),
        ],
        centerTitle: true,
      ),
      body: StreamBuilder<characters.CharactersData>(
          stream: MarvelInheritedWidget.of(context).bloc.charactersStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List _results = snapshot.data.data.results;
              int _itemCount = _results.length;
              return ListView.builder(
                  controller: _scrollController,
                  itemCount: _itemCount,
                  cacheExtent: _itemCount.toDouble(),
                  itemBuilder: (context, index) {
                    if (index == _itemCount - 1) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: CircularProgressIndicator(),
                      ));
                    } else {
                      return CharactersBuilder(
                        result: _results[index],
                      );
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
